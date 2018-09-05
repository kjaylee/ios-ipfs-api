//
//  Ipfs.swift
//  ipfsApi
//
//  Created by Jay on 2018. 8. 16..
//

import Foundation
import Moya

public class Ipfs : Moya.MoyaProvider<MultiTarget> {
    
    var baseAddress: String = "http://127.0.0.1:5001/api/v0"
    
    private static var sharedProvider: Ipfs = {
        #if DEBUG
        let provider = Ipfs(
            plugins: [NetworkLoggerPlugin(verbose: true)]
        )
        #else
        let provider = Ipfs()
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
    public func address() -> String {
        return baseAddress
    }
}

//MARK: - Did refer to js-ipfs-api interface.
extension Ipfs {
    //    ipfs.add(data, [options], [callback]).
    public class func add(data: Data,
                          options: ArgumentsAddModel? = nil,
                          callbackQueue: DispatchQueue? = nil,
                          progressBlock: Moya.ProgressBlock? = nil,
                          completion: @escaping Moya.Completion ) {
        Ipfs.shared().request(MultiTarget(IAService.add(file: data, arguments: options)),
                              callbackQueue: callbackQueue,
                              progress: progressBlock,
                              completion: completion)
    }
    //    ipfs.cat(ipfsPath, [callback]).
    public class func cat(ipfsPath: String,
                          callbackQueue: DispatchQueue? = nil,
                          progressBlock: Moya.ProgressBlock? = nil,
                          completion: @escaping Moya.Completion ) {
        Ipfs.shared().request(MultiTarget(IAService.cat(ipfsPath: ipfsPath)),
                              callbackQueue: callbackQueue, progress: progressBlock, completion: completion)
    }
    //    ipfs.get(ipfsPath, [options], [callback]).
    public class func get(arguments: ArgumentsGetModel,
                          callbackQueue: DispatchQueue? = nil,
                          progressBlock: Moya.ProgressBlock? = nil,
                          completion: @escaping Moya.Completion ) {
        Ipfs.shared().request(MultiTarget(IAService.get(arguments: arguments)),
                              callbackQueue: callbackQueue, progress: progressBlock, completion: completion)
    }
    //    ipfs.ls(ipfsPath, [options], [callback])
    public class func ls(arguments: ArgumentsLsModel,
                         callbackQueue: DispatchQueue? = nil,
                         progressBlock: Moya.ProgressBlock? = nil,
                         completion: @escaping Moya.Completion ) {
        Ipfs.shared().request(MultiTarget(IAService.ls(arguments: arguments)),
                              callbackQueue: callbackQueue, progress: progressBlock, completion: completion)
    }
    public class func ls(ipfsPath: String,
                         headers: Bool? = nil,
                         resolveType: Bool? = nil,
                         callbackQueue: DispatchQueue? = nil,
                         progressBlock: Moya.ProgressBlock? = nil,
                         completion: @escaping Moya.Completion ) {
        Ipfs.ls(arguments: ArgumentsLsModel(arg: ipfsPath, headers: headers, resolveType: resolveType),
                callbackQueue: callbackQueue,
                progressBlock: progressBlock,
                completion: completion)
    }
    //MARK: Files
    public class files {
        //MARK:  files
        //    ipfs.files.add(data, [options], [callback]). Alias to ipfs.add.
        public class func add(data: Data,
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
            Ipfs.add(data: data, options: ArgumentsAddModel(recursive: recursive,
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
                ),
                     callbackQueue: callbackQueue,
                     progressBlock: progressBlock,
                     completion: completion)
        }
        //    ipfs.files.cat(ipfsPath, [callback]). Alias to ipfs.cat.
        public class func cat(ipfsPath: String,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.cat(ipfsPath: ipfsPath,
                     callbackQueue: callbackQueue,
                     progressBlock: progressBlock,
                     completion: completion)
        }
        //    ipfs.files.get(ipfsPath, [options], [callback]). Alias to ipfs.get.
        public class func get(ipfsPath: String,
                              output: String? = nil,
                              archive: Bool? = nil,
                              compress: Bool? = nil,
                              compressionLevel: Int? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.get(arguments: ArgumentsGetModel(arg: ipfsPath,
                                                  output: output,
                                                  archive: archive,
                                                  compress: compress,
                                                  compressionLevel: compressionLevel
                ),
                     callbackQueue: callbackQueue,
                     progressBlock: progressBlock,
                     completion: completion)
        }
        //MARK: MFS (mutable file system) specific
        //    ipfs.files.cp([from, to], [callback])
        public class func cp(arguments: ArgumentsFilesCpModel,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.filesCp(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func cp(source: String, dest: String,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.files.cp(arguments: ArgumentsFilesCpModel(source: source, dest: dest),
                          callbackQueue: callbackQueue,
                          progressBlock: progressBlock,
                          completion: completion)
        }
        //    ipfs.files.flush([path], [callback])
        public class func flush(path: String? = nil,
                                callbackQueue: DispatchQueue? = nil,
                                progressBlock: Moya.ProgressBlock? = nil,
                                completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.filesFlush(path: path)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.files.ls([path], [options], [callback])
        public class func ls(arguments: ArgumentsFilesLsModel? = nil,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.filesLs(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func ls(path: String? = nil, long: Bool? = nil,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.files.ls(arguments: ArgumentsFilesLsModel(path: path, long: long),
                          callbackQueue: callbackQueue,
                          progressBlock: progressBlock,
                          completion: completion)
        }
        //    ipfs.files.mkdir(path, [options], [callback])
        public class func mkdir(arguments: ArgumentsFilesMkdirModel,
                                callbackQueue: DispatchQueue? = nil,
                                progressBlock: Moya.ProgressBlock? = nil,
                                completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.filesMkdir(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        
        public class func mkdir(path: String, parents: Bool? = nil,
                                callbackQueue: DispatchQueue? = nil,
                                progressBlock: Moya.ProgressBlock? = nil,
                                completion: @escaping Moya.Completion ) {
            Ipfs.files.mkdir(arguments: ArgumentsFilesMkdirModel(path: path, parents: parents),
                             callbackQueue: callbackQueue,
                             progressBlock: progressBlock,
                             completion: completion)
        }
        //    ipfs.files.mv([from, to], [callback])
        public class func mv(arguments: ArgumentsFilesMvModel,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.filesMv(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func mv(source: String, dest: String,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.files.mv(arguments: ArgumentsFilesMvModel(source: source, dest: dest),
                          callbackQueue: callbackQueue,
                          progressBlock: progressBlock,
                          completion: completion)
        }
        //    ipfs.files.read(path, [options], [callback])
        public class func read(arguments: ArgumentsFilesReadModel,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.filesRead(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func read(path: String,
                               offset: Int? = nil,
                               count: Int? = nil,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.files.read(arguments: ArgumentsFilesReadModel(path: path, offset: offset, count: count),
                            callbackQueue: callbackQueue,
                            progressBlock: progressBlock,
                            completion: completion)
        }
        //    ipfs.files.rm(path, [options], [callback])
        public class func rm(arguments: ArgumentsFilesRmModel,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.filesRm(arguments: arguments)),
                                  callbackQueue: callbackQueue, progress: progressBlock, completion: completion)
        }
        public class func rm(path: String, recursive: Bool? = nil,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.files.rm(arguments: ArgumentsFilesRmModel(path: path, recursive: recursive),
                          callbackQueue: callbackQueue, progressBlock: progressBlock, completion: completion)
        }
        //    ipfs.files.stat(path, [options], [callback])
        public class func stat(arguments: ArgumentsFilesStatModel,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.filesStat(arguments: arguments)),
                                  callbackQueue: callbackQueue, progress: progressBlock, completion: completion)
        }
        public class func stat(path: String,
                               format: String? = nil,
                               hash: Bool? = nil,
                               size: Bool? = nil,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.files.stat(arguments: ArgumentsFilesStatModel(path: path, format: format, hash: hash, size: size),
                            callbackQueue: callbackQueue,
                            progressBlock: progressBlock,
                            completion: completion)
        }
        //    ipfs.files.write(path, content, [options], [callback])
        public class func write(data: Data,
                                arguments: ArgumentsFilesWriteModel,
                                callbackQueue: DispatchQueue? = nil,
                                progressBlock: Moya.ProgressBlock? = nil,
                                completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.filesWrite(file: data, arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func write(data: Data,
                                path: String,
                                offset: Int? = nil,
                                create: Bool? = nil,
                                truncate: Bool? = nil,
                                count: Int? = nil,
                                callbackQueue: DispatchQueue? = nil,
                                progressBlock: Moya.ProgressBlock? = nil,
                                completion: @escaping Moya.Completion ) {
            Ipfs.files.write(data: data,
                             arguments: ArgumentsFilesWriteModel(path: path, offset: offset, create: create, truncate: truncate, count: count),
                             callbackQueue: callbackQueue,
                             progressBlock: progressBlock,
                             completion: completion)
        }
    }
    
    
    public class block {
        //MARK:  block
        //    ipfs.block.get(cid, [options], [callback])
        public class func get(key: String,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.blockGet(key: key)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.block.put(block, [options], [callback])
        public class func put(data: Data,
                              arguments: ArgumentsBlockPutModel? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.blockPut(file: data, arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func put(data: Data,
                              format: String? = nil,
                              mhtype: String? = nil,
                              mhlen: Int? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.blockPut(file: data,
                                                                 arguments: ArgumentsBlockPutModel(format: format, mhtype: mhtype, mhlen: mhlen))),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.block.stat(cid, [callback])
        public class func stat(key: String,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.blockStat(key: key)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
    }
    //MARK:  Graph
    public class dag {
        //MARK: dag
        //    ipfs.dag.get(cid, [path], [options], [callback])
        public class func get(ref: String,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.dagGet(ref: ref)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.dag.put(dagNode, [options], [callback])
        public class func put(data: Data,
                              arguments: ArgumentsDagPutModel? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.dagPut(file: data, arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func put(data: Data,
                              format: String? = nil,
                              inputEnc: String? = nil,
                              pin: Bool? = nil,
                              hash: String? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.dag.put(data: data,
                         arguments: ArgumentsDagPutModel(format: format, inputEnc: inputEnc, pin: pin, hash: hash),
                         callbackQueue: callbackQueue,
                         progressBlock: progressBlock,
                         completion: completion)
        }
        //    ipfs.dag.resolve
        public class func resolve(ref: String,
                                  callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.dagResolve(ref: ref)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
    }
    public class object {
        //MARK: object
        //    ipfs.object.data(multihash, [options], [callback])
        public class func data(key: String,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.objectData(key: key)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.object.get(multihash, [options], [callback])
        public class func get(key: String,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.objectGet(key: key)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.object.links(multihash, [options], [callback])
        public class func links(arguments: ArgumentsObjectLinksModel,
                                callbackQueue: DispatchQueue? = nil,
                                progressBlock: Moya.ProgressBlock? = nil,
                                completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.objectLinks(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func links(multihash: String,
                                headers: Bool? = nil,
                                callbackQueue: DispatchQueue? = nil,
                                progressBlock: Moya.ProgressBlock? = nil,
                                completion: @escaping Moya.Completion ) {
            Ipfs.object.links(arguments: ArgumentsObjectLinksModel(multihash: multihash, headers: headers),
                              callbackQueue: callbackQueue,
                              progressBlock: progressBlock,
                              completion: completion)
        }
        //    ipfs.object.new([template], [callback])
        public class func new(key: String,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.objectData(key: key)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class patch {
            //MARK: patch
            //    ipfs.object.patch.addLink(multihash, DAGLink, [options], [callback])
            public class func addLink(arguments: ArgumentsObjectPatchAddLinkModel,
                                      callbackQueue: DispatchQueue? = nil,
                                      progressBlock: Moya.ProgressBlock? = nil,
                                      completion: @escaping Moya.Completion ) {
                Ipfs.shared().request(MultiTarget(IAService.objectPatchAddLink(arguments: arguments)),
                                      callbackQueue: callbackQueue,
                                      progress: progressBlock,
                                      completion: completion)
            }
            public class func addLink(root: String,
                                      name: String,
                                      ref: String,
                                      verbose: Bool? = nil,
                                      callbackQueue: DispatchQueue? = nil,
                                      progressBlock: Moya.ProgressBlock? = nil,
                                      completion: @escaping Moya.Completion ) {
                Ipfs.object.patch.addLink(arguments: ArgumentsObjectPatchAddLinkModel(root: root, name: name, ref: ref, verbose: verbose),
                                          callbackQueue: callbackQueue,
                                          progressBlock: progressBlock,
                                          completion: completion)
            }
            //    ipfs.object.patch.appendData(multihash, data, [options], [callback])
            public class func appendData(data: Data,
                                         root: String,
                                         callbackQueue: DispatchQueue? = nil,
                                         progressBlock: Moya.ProgressBlock? = nil,
                                         completion: @escaping Moya.Completion ) {
                Ipfs.shared().request(MultiTarget(IAService.objectPatchAppendData(file: data, root: root)),
                                      callbackQueue: callbackQueue,
                                      progress: progressBlock,
                                      completion: completion)
            }
            //    ipfs.object.patch.rmLink(multihash, DAGLink, [options], [callback])
            public class func rmLink(arguments: ArgumentsObjectPatchRmLinkModel,
                                     callbackQueue: DispatchQueue? = nil,
                                     progressBlock: Moya.ProgressBlock? = nil,
                                     completion: @escaping Moya.Completion ) {
                Ipfs.shared().request(MultiTarget(IAService.objectPatchRmLink(arguments: arguments)),
                                      callbackQueue: callbackQueue,
                                      progress: progressBlock,
                                      completion: completion)
            }
            public class func rmLink(root: String,
                                     link: String,
                                     callbackQueue: DispatchQueue? = nil,
                                     progressBlock: Moya.ProgressBlock? = nil,
                                     completion: @escaping Moya.Completion ) {
                Ipfs.object.patch.rmLink(arguments: ArgumentsObjectPatchRmLinkModel(root: root, link: link),
                                         callbackQueue: callbackQueue,
                                         progressBlock: progressBlock,
                                         completion: completion)
            }
            //    ipfs.object.patch.setData(multihash, data, [options], [callback])
            public class func setData(data: Data, root: String,
                                      callbackQueue: DispatchQueue? = nil,
                                      progressBlock: Moya.ProgressBlock? = nil,
                                      completion: @escaping Moya.Completion ) {
                Ipfs.shared().request(MultiTarget(IAService.objectPatchSetData(file: data, root: root)),
                                      callbackQueue: callbackQueue,
                                      progress: progressBlock,
                                      completion: completion)
            }
        }
        //    ipfs.object.put(obj, [options], [callback])
        public class func put(data: Data,
                              arguments: ArgumentsObjectPutModel? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.objectPut(file: data, arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func put(data: Data,
                              inputenc: String? = nil,
                              datafieldenc: String? = nil,
                              pin: Bool? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.object.put(data: data, arguments: ArgumentsObjectPutModel(inputenc: inputenc, datafieldenc: datafieldenc, pin: pin),
                            callbackQueue: callbackQueue,
                            progressBlock: progressBlock,
                            completion: completion)
        }
        //    ipfs.object.stat(multihash, [options], [callback])
        public class func stat(key: String,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.objectStat(key: key)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
    }
    public class pin {
        //MARK: pin
        //    ipfs.pin.add(hash, [options], [callback])
        public class func add(arguments: ArgumentsPinAddModel,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.pinAdd(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func add(path: String,
                              recursive: Bool? = nil,
                              progress: Bool? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.pin.add(arguments: ArgumentsPinAddModel(path: path, recursive: recursive, progress: progress),
                         callbackQueue: callbackQueue,
                         progressBlock: progressBlock,
                         completion: completion)
        }
        //    ipfs.pin.ls([hash], [options], [callback])
        public class func ls(arguments: ArgumentsPinLsModel? = nil,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.pinLs(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func ls(path: String? = nil,
                             type: String? = nil,
                             quiet: Bool? = nil,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.pin.ls(arguments: ArgumentsPinLsModel(path: path, type: type, quiet: quiet),
                        callbackQueue: callbackQueue,
                        progressBlock: progressBlock,
                        completion: completion)
        }
        //    ipfs.pin.rm(hash, [options], [callback])
        public class func rm(arguments: ArgumentsPinRmModel,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.pinRm(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func rm(path: String,
                             recursive: Bool? = nil,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.pin.rm(path: path,
                        recursive: recursive,
                        callbackQueue: callbackQueue,
                        progressBlock: progressBlock,
                        completion: completion)
        }
    }
    public class refs {
        //MARK: refs
        //    ipfs.refs.local()
        public class func local(callbackQueue: DispatchQueue? = nil,
                                progressBlock: Moya.ProgressBlock? = nil,
                                completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.refsLocal()),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
    }
    //MARK: Network
    public class bootstrap {
        //MARK: bootstrap
        //    ipfs.bootstrap.add(addr, [options], [callback])
        public class func addDefault(callbackQueue: DispatchQueue? = nil,
                                     progressBlock: Moya.ProgressBlock? = nil,
                                     completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.bootstrapAddDefault()),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.bootstrap.list([callback])
        public class func list(callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.bootstrapList()),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.bootstrap.rm(addr, [options], [callback])
        public class func rmAll(callbackQueue: DispatchQueue? = nil,
                                progressBlock: Moya.ProgressBlock? = nil,
                                completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.bootstrapRmAll()),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
    }
    public class bitswap {
        //MARK: bitswap
        //    ipfs.bitswap.stat([callback])
        public class func stat(callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.bitswapStat()),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.bitswap.wantlist([peerId])
        public class func stat(peer: String,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.bitswapWantlist(peer: peer)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.bitswap.unwant(cid)
        public class func unwant(key: String,
                                 callbackQueue: DispatchQueue? = nil,
                                 progressBlock: Moya.ProgressBlock? = nil,
                                 completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.bitswapUnwant(key: key)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        
    }
    public class dht {
        //MARK: dht
        //    ipfs.dht.findpeer(peerId, [callback])
        public class func findpeer(arguments: ArgumentsDhtFindpeerModel,
                                   callbackQueue: DispatchQueue? = nil,
                                   progressBlock: Moya.ProgressBlock? = nil,
                                   completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.dhtFindpeer(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func findpeer(peerID: String,
                                   verbose: Bool? = nil,
                                   callbackQueue: DispatchQueue? = nil,
                                   progressBlock: Moya.ProgressBlock? = nil,
                                   completion: @escaping Moya.Completion ) {
            Ipfs.dht.findpeer(arguments: ArgumentsDhtFindpeerModel(peerID: peerID, verbose: verbose),
                              callbackQueue: callbackQueue,
                              progressBlock: progressBlock,
                              completion: completion)
        }
        //    ipfs.dht.findprovs(hash, [callback])
        public class func findprovs(arguments: ArgumentsDhtFindprovsModel,
                                    callbackQueue: DispatchQueue? = nil,
                                    progressBlock: Moya.ProgressBlock? = nil,
                                    completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.dhtFindprovs(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func findprovs(key: String,
                                    verbose: Bool? = nil,
                                    numProviders: Int? = nil,
                                    callbackQueue: DispatchQueue? = nil,
                                    progressBlock: Moya.ProgressBlock? = nil,
                                    completion: @escaping Moya.Completion ) {
            Ipfs.dht.findprovs(arguments: ArgumentsDhtFindprovsModel(key: key, verbose: verbose, numProviders: numProviders),
                               callbackQueue: callbackQueue,
                               progressBlock: progressBlock,
                               completion: completion)
        }
        //    ipfs.dht.get(key, [callback])
        public class func get(arguments: ArgumentsDhtGetModel,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.dhtGet(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func get(key: String,
                              verbose: Bool? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.dht.get(arguments: ArgumentsDhtGetModel(key: key, verbose: verbose),
                         callbackQueue: callbackQueue,
                         progressBlock: progressBlock,
                         completion: completion)
        }
        //    ipfs.dht.provide(cid, [callback])
        public class func provide(arguments: ArgumentsDhtProvideModel,
                                  callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.dhtProvide(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func provide(key: String,
                                  verbose: Bool? = nil,
                                  recursive: Bool? = nil,
                                  callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.dht.provide(arguments: ArgumentsDhtProvideModel(key: key, verbose: verbose, recursive: recursive),
                             callbackQueue: callbackQueue,
                             progressBlock: progressBlock,
                             completion: completion)
        }
        //    ipfs.dht.put(key, value, [callback])
        public class func put(arguments: ArgumentsDhtPutModel,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.dhtPut(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func put(key: String,
                              value: String,
                              verbose: Bool? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.dht.put(arguments: ArgumentsDhtPutModel(key: key, value: value, verbose: verbose),
                         callbackQueue: callbackQueue,
                         progressBlock: progressBlock,
                         completion: completion)
        }
        
    }
    public class pubsub {
        //MARK: pubsub
        //    ipfs.pubsub.ls(topic, [callback])
        public class func ls(callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.pubsubLs()),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.pubsub.peers(topic, [callback])
        public class func peers(topic: String? = nil,
                                callbackQueue: DispatchQueue? = nil,
                                progressBlock: Moya.ProgressBlock? = nil,
                                completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.pubsubPeers(topic: topic)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.pubsub.publish(topic, data, [callback])
        public class func publish(arguments: ArgumentsPubsubPubModel,
                                  callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.pubsubPub(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func publish(topic: String,
                                  data: String,
                                  callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.pubsub.publish(arguments: ArgumentsPubsubPubModel(topic: topic, data: data),
                                callbackQueue: callbackQueue,
                                progressBlock: progressBlock,
                                completion: completion)
        }
        
        //    ipfs.pubsub.subscribe(topic, handler, [options], [callback])
        public class func subscribe(arguments: ArgumentsPubsubSubModel,
                                    callbackQueue: DispatchQueue? = nil,
                                    progressBlock: Moya.ProgressBlock? = nil,
                                    completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.pubsubSub(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func subscribe(topic: String,
                                    discover: Bool? = nil,
                                    callbackQueue: DispatchQueue? = nil,
                                    progressBlock: Moya.ProgressBlock? = nil,
                                    completion: @escaping Moya.Completion ) {
            Ipfs.pubsub.subscribe(arguments: ArgumentsPubsubSubModel(topic: topic, discover: discover),
                                  callbackQueue: callbackQueue,
                                  progressBlock: progressBlock,
                                  completion: completion)
        }
        
    }
    public class swarm {
        //MARK: swarm
        //    ipfs.swarm.addrs([callback])
        public class addrs {
            //    /swarm/addrs/listen
            public class func listen(callbackQueue: DispatchQueue? = nil,
                                     progressBlock: Moya.ProgressBlock? = nil,
                                     completion: @escaping Moya.Completion ) {
                Ipfs.shared().request(MultiTarget(IAService.swarmAddrsListen()),
                                      callbackQueue: callbackQueue,
                                      progress: progressBlock,
                                      completion: completion)
            }
            //    /swarm/addrs/local
            public class func local(id: Bool? = nil,
                                    callbackQueue: DispatchQueue? = nil,
                                    progressBlock: Moya.ProgressBlock? = nil,
                                    completion: @escaping Moya.Completion ) {
                Ipfs.shared().request(MultiTarget(IAService.swarmAddrsLocal(id: id)),
                                      callbackQueue: callbackQueue,
                                      progress: progressBlock,
                                      completion: completion)
            }
        }
        //    ipfs.swarm.connect(addr, [callback])
        public class func connect(address: String,
                                  callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.swarmConnect(address: address)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.swarm.disconnect(addr, [callback])
        public class func disconnect(address: String,
                                     callbackQueue: DispatchQueue? = nil,
                                     progressBlock: Moya.ProgressBlock? = nil,
                                     completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.swarmDisconnect(address: address)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.swarm.peers([options], [callback])
        public class func peers(arguments: ArgumentsSwarmPeersModel? = nil,
                                callbackQueue: DispatchQueue? = nil,
                                progressBlock: Moya.ProgressBlock? = nil,
                                completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.swarmPeers(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func peers(verbose: Bool? = nil,
                                streams: Bool? = nil,
                                latency: Bool? = nil,
                                callbackQueue: DispatchQueue? = nil,
                                progressBlock: Moya.ProgressBlock? = nil,
                                completion: @escaping Moya.Completion ) {
            Ipfs.swarm.peers(arguments: ArgumentsSwarmPeersModel(verbose: verbose, streams: streams, latency: latency),
                             callbackQueue: callbackQueue,
                             progressBlock: progressBlock,
                             completion: completion)
        }
    }
    public class name {
        //MARK:  name
        //    ipfs.name.publish(addr, [options], [callback])
        public class func publish(arguments: ArgumentsNamePublishModel,
                                  callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.namePublish(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func publish(path: String,
                                  resolve: Bool? = nil,
                                  lifetime: String? = nil,
                                  ttl: String? = nil,
                                  key: String? = nil,
                                  callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.name.publish(arguments: ArgumentsNamePublishModel(path: path, resolve: resolve, lifetime: lifetime, ttl: ttl, key: key),
                              callbackQueue: callbackQueue,
                              progressBlock: progressBlock,
                              completion: completion)
        }
        //    ipfs.name.resolve(addr, [options], [callback])
        public class func resolve(arguments: ArgumentsNameResolveModel? = nil,
                                  callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.nameResolve(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func resolve(name: String? = nil,
                                  recursive: Bool? = nil,
                                  nocache: Bool? = nil,
                                  callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.name.resolve(arguments: ArgumentsNameResolveModel(name: name, recursive: recursive, nocache: nocache),
                              callbackQueue: callbackQueue,
                              progressBlock: progressBlock,
                              completion: completion)
        }
        
    }
    //MARK: Node Management
    //MARK: miscellaneous operations
    //    ipfs.dns(domain, [callback])
    public class func dns(arguments: ArgumentsDnsModel,
                          callbackQueue: DispatchQueue? = nil,
                          progressBlock: Moya.ProgressBlock? = nil,
                          completion: @escaping Moya.Completion ) {
        Ipfs.shared().request(MultiTarget(IAService.dns(arguments: arguments)),
                              callbackQueue: callbackQueue,
                              progress: progressBlock,
                              completion: completion)
    }
    public class func dns(domain: String,
                          recursive: Bool? = nil,
                          callbackQueue: DispatchQueue? = nil,
                          progressBlock: Moya.ProgressBlock? = nil,
                          completion: @escaping Moya.Completion ) {
        Ipfs.dns(arguments: ArgumentsDnsModel(domain: domain, recursive: recursive),
                 callbackQueue: callbackQueue,
                 progressBlock: progressBlock,
                 completion: completion)
    }
    //    ipfs.id([callback])
    public class func id(arguments: ArgumentsIdModel? = nil,
                         callbackQueue: DispatchQueue? = nil,
                         progressBlock: Moya.ProgressBlock? = nil,
                         completion: @escaping Moya.Completion ) {
        Ipfs.shared().request(MultiTarget(IAService.id(arguments: arguments)),
                              callbackQueue: callbackQueue,
                              progress: progressBlock,
                              completion: completion)
    }
    public class func id(peerID: String? = nil,
                         format: String? = nil,
                         callbackQueue: DispatchQueue? = nil,
                         progressBlock: Moya.ProgressBlock? = nil,
                         completion: @escaping Moya.Completion ) {
        Ipfs.id(arguments: ArgumentsIdModel(peerID: peerID, format: format),
                callbackQueue: callbackQueue,
                progressBlock: progressBlock,
                completion: completion)
    }
    //    ipfs.ping(id, [options], [callback])
    public class func ping(arguments: ArgumentsPingModel,
                           callbackQueue: DispatchQueue? = nil,
                           progressBlock: Moya.ProgressBlock? = nil,
                           completion: @escaping Moya.Completion ) {
        Ipfs.shared().request(MultiTarget(IAService.ping(arguments: arguments)),
                              callbackQueue: callbackQueue,
                              progress: progressBlock,
                              completion: completion)
    }
    public class func ping(peerID: String,
                           count: Int? = nil,
                           callbackQueue: DispatchQueue? = nil,
                           progressBlock: Moya.ProgressBlock? = nil,
                           completion: @escaping Moya.Completion ) {
        Ipfs.ping(arguments: ArgumentsPingModel(peerID: peerID, count: count),
                  callbackQueue: callbackQueue,
                  progressBlock: progressBlock,
                  completion: completion)
    }
    //    ipfs.stop([callback]). Alias to ipfs.shutdown.
    public class func shutdown(callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
        Ipfs.shared().request(MultiTarget(IAService.shutdown()),
                              callbackQueue: callbackQueue,
                              progress: progressBlock,
                              completion: completion)
    }
    public class func stop(callbackQueue: DispatchQueue? = nil,
                           progressBlock: Moya.ProgressBlock? = nil,
                           completion: @escaping Moya.Completion ) {
        Ipfs.shutdown(callbackQueue: callbackQueue, progressBlock: progressBlock, completion: completion)
    }
    //    ipfs.version([callback])
    public class func version(arguments: ArgumentsVersionModel? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
        Ipfs.shared().request(MultiTarget(IAService.version(arguments: arguments)),
                              callbackQueue: callbackQueue,
                              progress: progressBlock,
                              completion: completion)
    }
    public class func version(number: Bool? = nil,
                              commit: Bool? = nil,
                              repo: Bool? = nil,
                              all: Bool? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
        Ipfs.version(arguments: ArgumentsVersionModel(number: number, commit: commit, repo: repo, all: all),
                     callbackQueue: callbackQueue,
                     progressBlock: progressBlock,
                     completion: completion)
    }
    public class config {
        //MARK: config
        //    ipfs.config.get([key], [callback])
        //  /config/show
        public class func show(callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.configShow()),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.config.replace(config, [callback])
        public class func replace(data: Data,
                                  callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.configReplace(file: data)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.config.set(key, value, [callback])
        //  /config/edit
        public class func edit(callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.configEdit()),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        
    }
    public class stats {
        //MARK: stats
        //    ipfs.stats.bitswap([callback])
        public class func bitswap(callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.statsBitswap()),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.stats.bw([options], [callback])
        public class func bw(arguments: ArgumentsStatsBwModel? = nil,
                                  callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.statsBw(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func bw(peer: String? = nil,
                             proto: String? = nil,
                             poll: Bool? = nil,
                             interval: String? = nil,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.stats.bw(arguments: ArgumentsStatsBwModel(peer: peer, proto: proto, poll: poll, interval: interval),
                          callbackQueue: callbackQueue,
                          progressBlock: progressBlock,
                          completion: completion)
        }
        //    ipfs.stats.repo([options], [callback])
        public class func repo(human: Bool? = nil,
                                  callbackQueue: DispatchQueue? = nil,
                                  progressBlock: Moya.ProgressBlock? = nil,
                                  completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.statsRepo(human:human)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        
    }
    public class log {
        //MARK: log
        //    ipfs.log.level(subsystem, level, [options], [callback])
        public class func level(arguments: ArgumentsLogLevelModel,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.logLevel(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func level(subsystem: String,
                                level: String,
                                callbackQueue: DispatchQueue? = nil,
                                progressBlock: Moya.ProgressBlock? = nil,
                                completion: @escaping Moya.Completion ) {
            Ipfs.log.level(arguments: ArgumentsLogLevelModel(subsystem: subsystem, level: level), callbackQueue: callbackQueue, progressBlock: progressBlock, completion: completion)
        }
        //    ipfs.log.ls([callback])
        public class func ls(callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.logLs()),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.log.tail([callback])
        public class func tail(callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.logTail()),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
    }
    public class repo {
        //MARK: repo
        //    ipfs.repo.gc([options], [callback])
        public class func gc(arguments: ArgumentsRepoGcModel,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.repoGc(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func gc(quiet: Bool? = nil,
                             streamErrors: Bool? = nil,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.repo.gc(arguments: ArgumentsRepoGcModel(quiet: quiet, streamErrors: streamErrors), callbackQueue: callbackQueue, progressBlock: progressBlock, completion: completion)
        }
        //    ipfs.repo.stat([options], [callback])
        public class func stat(human: Bool? = nil,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.repoStat(human: human)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.repo.version([callback])
        public class func version(quiet: Bool? = nil,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.repoVersion(quiet: quiet)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
    }
    public class key {
        //MARK: key
        //    ipfs.key.gen(name, [options], [callback])
        public class func gen(arguments: ArgumentsKeyGenModel,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.keyGen(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func gen(name: String,
                              type: String? = nil,
                              size: Int? = nil,
                              callbackQueue: DispatchQueue? = nil,
                              progressBlock: Moya.ProgressBlock? = nil,
                              completion: @escaping Moya.Completion ) {
            Ipfs.key.gen(arguments: ArgumentsKeyGenModel(name: name, type: type, size: size),
                         callbackQueue: callbackQueue,
                         progressBlock: progressBlock,
                         completion: completion)
        }
        //    ipfs.key.list([options, callback])
        public class func list(l: Bool?,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.keyList(l: l)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        //    ipfs.key.rename(oldName, newName, [callback])
        public class func rename(arguments: ArgumentsKeyRenameModel,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.keyRename(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func rename(oldName: String,
                                 newName: String,
                                 force: Bool? = nil,
                                 callbackQueue: DispatchQueue? = nil,
                                 progressBlock: Moya.ProgressBlock? = nil,
                                 completion: @escaping Moya.Completion ) {
            Ipfs.key.rename(arguments: ArgumentsKeyRenameModel(oldName: oldName, newName: newName, force: force), callbackQueue: callbackQueue, progressBlock: progressBlock, completion: completion)
        }
        //    ipfs.key.rm(name, [callback])
        public class func rm(arguments: ArgumentsKeyRmModel,
                               callbackQueue: DispatchQueue? = nil,
                               progressBlock: Moya.ProgressBlock? = nil,
                               completion: @escaping Moya.Completion ) {
            Ipfs.shared().request(MultiTarget(IAService.keyRm(arguments: arguments)),
                                  callbackQueue: callbackQueue,
                                  progress: progressBlock,
                                  completion: completion)
        }
        public class func rm(name: String,
                             information: Bool? = nil,
                             callbackQueue: DispatchQueue? = nil,
                             progressBlock: Moya.ProgressBlock? = nil,
                             completion: @escaping Moya.Completion ) {
            Ipfs.key.rm(arguments: ArgumentsKeyRmModel(name: name, information: information), callbackQueue: callbackQueue, progressBlock: progressBlock, completion: completion)
        }
    }
    
}

