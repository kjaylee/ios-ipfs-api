//
//  Ipfs.swift
//  ipfsApi
//
//  Created by Jay on 2018. 8. 16..
//

import Foundation
import Moya

public class Ipfs : MoyaProvider<MultiTarget> {
    
    var baseAddress: String = "http://127.0.0.1:5001/api/v0"
    
    private static var sharedProvider: Ipfs = {
        #if DEBUG
        let provider = Ipfs(
            plugins: [NetworkLoggerPlugin(verbose: true)]
        )
        #else
        let provider = IAProvider()
        #endif
        return provider
    }()
    
    public class func shared() -> Ipfs {
        return sharedProvider
    }
}

//Initialize IPFS host address
extension Ipfs {
    public func setBase(address:String, port:Int? = 5001, apiVersionPath:String? = "/api/v0") {
        self.baseAddress = address + String(describing: ":\(port!)") + apiVersionPath!
    }
}

//MARK: - Did refer to js-ipfs-api interface.
extension Ipfs {
    //    ipfs.add(data, [options], [callback]).
    public class func add(_ data: Data, options: ArgumentsAddModel? = nil, callbackQueue: DispatchQueue? = nil, progress: Moya.ProgressBlock? = nil, completion: @escaping Moya.Completion ) {
        Ipfs.shared().request(MultiTarget(IAService.add(file: data, arguments: options)), callbackQueue: callbackQueue, progress: progress, completion: completion)
    }
    
    //    ipfs.cat(ipfsPath, [callback]).
    public class func cat(_ ipfsPath: String, callbackQueue: DispatchQueue? = nil, progress: Moya.ProgressBlock? = nil, completion: @escaping Moya.Completion ) {
        Ipfs.shared().request(MultiTarget(IAService.cat(ipfsPath: ipfsPath)), callbackQueue: callbackQueue, progress: progress, completion: completion)
    }
    
    //    ipfs.get(ipfsPath, [options], [callback]).
    public class func get(_ arguments: ArgumentsGetModel,
                          callbackQueue: DispatchQueue? = nil,
                          progress: Moya.ProgressBlock? = nil,
                          completion: @escaping Moya.Completion ) {
        Ipfs.shared().request(MultiTarget(IAService.get(arguments: arguments)), callbackQueue: callbackQueue, progress: progress, completion: completion)
    }
    
    //    ipfs.ls(ipfsPath, [options], [callback])
    public class func ls(_ arguments: ArgumentsLsModel,
                         callbackQueue: DispatchQueue? = nil,
                         progressBlock: Moya.ProgressBlock? = nil,
                         completion: @escaping Moya.Completion ) {
        Ipfs.shared().request(MultiTarget(IAService.ls(arguments: arguments)), callbackQueue: callbackQueue, progress: progressBlock, completion: completion)
    }
    
    public class func ls(_ ipfsPath: String,
        headers: Bool? = nil,
        resolveType: Bool? = nil,
        callbackQueue: DispatchQueue? = nil,
        progressBlock: Moya.ProgressBlock? = nil,
        completion: @escaping Moya.Completion ) {
        Ipfs.ls(ArgumentsLsModel(arg: ipfsPath, headers: headers, resolveType: resolveType), callbackQueue: callbackQueue, progressBlock: progressBlock, completion: completion)
    }
    
    
    
    //MARK: Files
    
    public class files {
        //MARK:  files
        //    ipfs.files.add(data, [options], [callback]). Alias to ipfs.add.
        public class func add(_ data: Data,
                              recursive: Bool? = nil,
                              quiet: Bool? = nil,
                              quieter: Bool? = nil,
                              silent: Bool? = nil,
                              progress: Bool? = nil,
                              triclke: Bool? = nil,
                              onlyHash: Bool? = nil,
                              wrapWithDirectory: Bool? = nil,
                              hidden: Bool? = nil,
                              chunker: String? = nil,
                              pin: Bool? = nil,
                              rawLeaves: Bool? = nil,
                              nocopy: Bool? = nil,
                              fscache: Bool? = nil,
                              cidVersion: Int? = nil,
                              hash: String? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.add(data, options: ArgumentsAddModel(recursive: recursive,
                                                         quiet: quiet,
                                                         quieter: quieter,
                                                         silent: silent,
                                                         progress: progress,
                                                         triclke: triclke,
                                                         onlyHash: onlyHash,
                                                         wrapWithDirectory: wrapWithDirectory,
                                                         hidden: hidden,
                                                         chunker: chunker,
                                                         pin: pin,
                                                         rawLeaves: rawLeaves,
                                                         nocopy: nocopy,
                                                         fscache: fscache,
                                                         cidVersion: cidVersion,
                                                         hash: hash
            ), callbackQueue: callbackQueue, progress: progressBlock, completion: completion)
        }
        //    ipfs.files.cat(ipfsPath, [callback]). Alias to ipfs.cat.
        public class func cat(_ ipfsPath: String, callbackQueue: DispatchQueue? = nil, progressBlock: Moya.ProgressBlock? = nil, completion: @escaping Moya.Completion ) {
            Ipfs.cat(ipfsPath, callbackQueue: callbackQueue, progress: progressBlock, completion: completion)
        }
        //    ipfs.files.get(ipfsPath, [options], [callback]). Alias to ipfs.get.
        public class func get(_ ipfsPath: String,
                              output: String? = nil,
                              archive: Bool? = nil,
                              compress: Bool? = nil,
                              compressionLevel: Int? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.get(ArgumentsGetModel(arg: ipfsPath,
                                       output: output,
                                       archive: archive,
                                       compress: compress,
                                       compressionLevel: compressionLevel
            ), callbackQueue: callbackQueue, progress: progressBlock, completion: completion)
        }
        //MARK: MFS (mutable file system) specific
        //    ipfs.files.cp([from, to], [callback])
        //    ipfs.files.flush([path], [callback])
        //    ipfs.files.ls([path], [options], [callback])
        //    ipfs.files.mkdir(path, [options], [callback])
        //    ipfs.files.mv([from, to], [callback])
        //    ipfs.files.read(path, [options], [callback])
        //    ipfs.files.rm(path, [options], [callback])
        //    ipfs.files.stat(path, [options], [callback])
        //    ipfs.files.write(path, content, [options], [callback])
    }
    
    
    public class block {
        //MARK:  block
        //    ipfs.block.get(cid, [options], [callback])
        //    ipfs.block.put(block, [options], [callback])
        //    ipfs.block.stat(cid, [callback])
    }
    //MARK:  Graph
    public class dag {
        //MARK: dag
        //    ipfs.dag.get(cid, [path], [options], [callback])
        //    ipfs.dag.put(dagNode, [options], [callback])
        //    ipfs.dag.tree(cid, [path], [options], [callback])
    }
    public class object {
        //MARK: object
        //
        //    ipfs.object.data(multihash, [options], [callback])
        //    ipfs.object.get(multihash, [options], [callback])
        //    ipfs.object.links(multihash, [options], [callback])
        //    ipfs.object.new([template], [callback])
        //    ipfs.object.patch.addLink(multihash, DAGLink, [options], [callback])
        //    ipfs.object.patch.appendData(multihash, data, [options], [callback])
        //    ipfs.object.patch.rmLink(multihash, DAGLink, [options], [callback])
        //    ipfs.object.patch.setData(multihash, data, [options], [callback])
        //    ipfs.object.put(obj, [options], [callback])
        //    ipfs.object.stat(multihash, [options], [callback])
    }
    public class pin {
        //MARK: pin
        //
        //    ipfs.pin.add(hash, [options], [callback])
        //    ipfs.pin.ls([hash], [options], [callback])
        //    ipfs.pin.rm(hash, [options], [callback])
    }
    public class refs {
        //MARK: refs
        //
        //    ipfs.refs.local()
    }
    //MARK: Network
    public class bootstrap {
        //MARK: bootstrap
        //
        //    ipfs.bootstrap.add(addr, [options], [callback])
        //    ipfs.bootstrap.list([callback])
        //    ipfs.bootstrap.rm(addr, [options], [callback])
    }
    public class bitswap {
        //MARK: bitswap
        //
        //    ipfs.bitswap.stat([callback])
        //    ipfs.bitswap.wantlist([peerId])
        //    ipfs.bitswap.unwant(cid)
    }
    public class dht {
        //MARK: dht
        //
        //    ipfs.dht.findpeer(peerId, [callback])
        //    ipfs.dht.findprovs(hash, [callback])
        //    ipfs.dht.get(key, [callback])
        //    ipfs.dht.provide(cid, [callback])
        //    ipfs.dht.put(key, value, [callback])
        
    }
    public class pubsub {
        //MARK: pubsub
        //
        //    ipfs.pubsub.ls(topic, [callback])
        //    ipfs.pubsub.peers(topic, [callback])
        //    ipfs.pubsub.publish(topic, data, [callback])
        //    ipfs.pubsub.subscribe(topic, handler, [options], [callback])
        //    ipfs.pubsub.unsubscribe(topic, handler, [callback])
        
    }
    public class swarm {
        //MARK: swarm
        //
        //    ipfs.swarm.addrs([callback])
        //    ipfs.swarm.connect(addr, [callback])
        //    ipfs.swarm.disconnect(addr, [callback])
        //    ipfs.swarm.peers([options], [callback])
    }
    public class name {
        //MARK:  name
        //
        //    ipfs.name.publish(addr, [options], [callback])
        //    ipfs.name.resolve(addr, [options], [callback])
        
    }
    //MARK: Node Management
    
    //MARK: miscellaneous operations
    //
    //    ipfs.dns(domain, [callback])
    //    ipfs.id([callback])
    //    ipfs.ping(id, [options], [callback])
    //    ipfs.stop([callback]). Alias to ipfs.shutdown.
    //    ipfs.version([callback])
    public class config {
        //MARK: config
        //
        //    ipfs.config.get([key], [callback])
        //    ipfs.config.replace(config, [callback])
        //    ipfs.config.set(key, value, [callback])
        
    }
    public class stats {
        //MARK: stats
        //
        //    ipfs.stats.bitswap([callback])
        //    ipfs.stats.bw([options], [callback])
        //    ipfs.stats.repo([options], [callback])
        
    }
    public class log {
        //MARK: log
        //
        //    ipfs.log.level(subsystem, level, [options], [callback])
        //    ipfs.log.ls([callback])
        //    ipfs.log.tail([callback])
    }
    public class repo {
        //MARK: repo
        //
        //    ipfs.repo.gc([options], [callback])
        //    ipfs.repo.stat([options], [callback])
        //    ipfs.repo.version([callback])
    }
    public class key {
        //MARK: key
        //
        //    ipfs.key.export(name, password, [callback])
        //    ipfs.key.gen(name, [options], [callback])
        //    ipfs.key.import(name, pem, password, [callback])
        //    ipfs.key.list([options, callback])
        //    ipfs.key.rename(oldName, newName, [callback])
        //    ipfs.key.rm(name, [callback])
    }
    
}

