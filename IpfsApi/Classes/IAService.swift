//
//  IAService.swift
//  ipfs-api service
//
//  Created by Jay on 2018. 4. 25..
//  Copyright © 2018년 Jay All rights reserved.
//
// ipfs-api service
import Foundation
import Alamofire
import Moya

enum IAService {
    /*
    Add a file or directory to ipfs.
    Argument “path” is of file type. This endpoint expects a file in the body of the request as ‘multipart/form-data’.
    curl -F file=@myfile "http://localhost:5001/api/v0/add?recursive=false&quiet=<value>&quieter=<value>&silent=<value>&progress=<value>&trickle=<value>&only-hash=<value>&wrap-with-directory=<value>&hidden=<value>&chunker=<value>&pin=true&raw-leaves=<value>&nocopy=<value>&fscache=<value>&cid-version=0&hash=sha2-256"
     */
    case add(file: Data, arguments: ArgumentsAddModel?)
    /*
     Show the current ledger for a peer.
     curl "http://localhost:5001/api/v0/bitswap/ledger?arg=<peer>"
     */
    case bitswapLedger(peer: String)
    /*
     Trigger reprovider.
     This endpoint returns a `text/plain` response body.
     curl "http://localhost:5001/api/v0/bitswap/reprovide"
     */
    case bitswapReprovide()
    /*
     Show some diagnostic information on the bitswap agent.
     curl "http://localhost:5001/api/v0/bitswap/stat"
     */
    case bitswapStat()
    /*
     Remove a given block from your wantlist.
     This endpoint returns a `text/plain` response body.
     curl "http://localhost:5001/api/v0/bitswap/unwant?arg=<key>"
     */
    case bitswapUnwant(key: String)
    /*
     Show blocks currently on the wantlist.
     curl "http://localhost:5001/api/v0/bitswap/wantlist?peer=<value>"
     */
    case bitswapWantlist(peer: String)
    /*
     Get a raw IPFS block.
     curl "http://localhost:5001/api/v0/block/get?arg=<key>"
     */
    case blockGet(key: String)
    /*
     Store input as an IPFS block.
     curl -F file=@myfile "http://localhost:5001/api/v0/block/put?format=v0&mhtype=sha2-256&mhlen=-1"
     */
    case blockPut(file: Data, arguments: ArgumentsBlockPutModel?)
    /*
     Remove IPFS block(s).
     curl "http://localhost:5001/api/v0/block/rm?arg=<hash>&force=false&quiet=false"
     */
    case blockRm(arguments: ArgumentsBlockRmModel)
    /*
     Print information of a raw IPFS block.
     curl "http://localhost:5001/api/v0/block/stat?arg=<key>"
     */
    case blockStat(key: String)
    /*
     Add default peers to the bootstrap list.
     curl "http://localhost:5001/api/v0/bootstrap/add/default"
     */
    case bootstrapAddDefault()
    /*
     Show peers in the bootstrap list.
     curl "http://localhost:5001/api/v0/bootstrap/list"
     */
    case bootstrapList()
    /*
     Remove all peers from the bootstrap list.
     curl "http://localhost:5001/api/v0/bootstrap/rm/all"
     */
    case bootstrapRmAll()
    /*
     Show IPFS object data.
     curl "http://localhost:5001/api/v0/cat?arg=<ipfs-path>"
     */
    case cat(ipfsPath: String)
    /*
     List all available commands.
     curl "http://localhost:5001/api/v0/commands?flags=false"
     */
    case commands(flags: Bool?)
    /*
     Open the config file for editing in $EDITOR.
     This endpoint returns a `text/plain` response body.
     curl "http://localhost:5001/api/v0/config/edit"
     */
    case configEdit()
    /*
     Replace the config with .
     Argument “file” is of file type. This endpoint expects a file in the body of the request as ‘multipart/form-data’.
     This endpoint returns a `text/plain` response body.
     curl -F file=@myfile "http://localhost:5001/api/v0/config/replace"
     */
    case configReplace(file: Data)
    /*
     Output config file contents.
     This endpoint returns a `text/plain` response body.
     curl "http://localhost:5001/api/v0/config/show"
     */
    case configShow()
    /*
     Get a dag node from ipfs.
     This endpoint returns a `text/plain` response body.
     curl "http://localhost:5001/api/v0/dag/get?arg=<ref>"
     */
    case dagGet(ref: String)
    /*
     Add a dag node to ipfs.
     Argument “file” is of file type. This endpoint expects a file in the body of the request as ‘multipart/form-data’.
     curl -F file=@myfile "http://localhost:5001/api/v0/dag/put?format=cbor&input-enc=json&pin=false&hash=<value>"     */
    case dagPut(file: Data, arguments: ArgumentsDagPutModel?)
    /*
     Resolve ipld block
     curl "http://localhost:5001/api/v0/dag/resolve?arg=<ref>"
     */
    case dagResolve(ref: String)
    /*
     Query the DHT for all of the multiaddresses associated with a Peer ID.
     curl "http://localhost:5001/api/v0/dht/findpeer?arg=<peerID>&verbose=false"
     */
    case dhtFindpeer(arguments: ArgumentsDhtFindpeerModel)
    /*
     Find peers in the DHT that can provide a specific value, given a key.
     curl "http://localhost:5001/api/v0/dht/findprovs?arg=<key>&verbose=false&num-providers=20"
     */
    case dhtFindprovs(arguments: ArgumentsDhtFindprovsModel)
    /*
     Given a key, query the DHT for its best value.
     curl "http://localhost:5001/api/v0/dht/get?arg=<key>&verbose=false"
     */
    case dhtGet(arguments: ArgumentsDhtGetModel)
    /*
     Announce to the network that you are providing given values.
     curl "http://localhost:5001/api/v0/dht/provide?arg=<key>&verbose=false&recursive=false"
     */
    case dhtProvide(arguments: ArgumentsDhtProvideModel)
    /*
     Write a key/value pair to the DHT.
     curl "http://localhost:5001/api/v0/dht/put?arg=<key>&arg=<value>&verbose=false"
     */
    case dhtPut(arguments: ArgumentsDhtPutModel)
    /*
     Find the closest Peer IDs to a given Peer ID by querying the DHT.
     curl "http://localhost:5001/api/v0/dht/query?arg=<peerID>&verbose=false"
     */
    case dhtQuery(arguments: ArgumentsDhtQueryModel)
    /*
     Clear inactive requests from the log.
     curl "http://localhost:5001/api/v0/diag/cmds/clear"
     */
    case diagCmdsClear()
    /*
     Set how long to keep inactive requests in the log.
     curl "http://localhost:5001/api/v0/diag/cmds/set-time?arg=<time>"
     */
    case diagCmdsSetTime(time: String)
    /*
     Print system diagnostic information.
     This endpoint returns a `text/plain` response body.
     curl "http://localhost:5001/api/v0/diag/sys"
     */
    case diagSys()
    /*
     Resolve DNS links.
     curl "http://localhost:5001/api/v0/dns?arg=<domain-name>&recursive=false"
     */
    case dns(arguments: ArgumentsDnsModel)
    /*
     List directory contents for Unix filesystem objects.
     curl "http://localhost:5001/api/v0/file/ls?arg=<ipfs-path>"
     */
    case fileLs(ipfsPath: String)
    /*
     Copy files into mfs.
     curl "http://localhost:5001/api/v0/files/cp?arg=<source>&arg=<dest>"
     */
    case filesCp(arguments: ArgumentsFilesCpModel)
    /*
     Flush a given path’s data to disk.
     curl "http://localhost:5001/api/v0/files/flush?arg=<path>"
     */
    case filesFlush(path: String?)
    /*
     List directories in the local mutable namespace.
     curl "http://localhost:5001/api/v0/files/ls?arg=<path>&l=<value>"
     */
    case filesLs(arguments: ArgumentsFilesLsModel)
    /*
     Make directories.
     curl "http://localhost:5001/api/v0/files/mkdir?arg=<path>&parents=<value>"
     */
    case filesMkdir(arguments: ArgumentsFilesMkdirModel)
    /*
     Move files.
     curl "http://localhost:5001/api/v0/files/mv?arg=<source>&arg=<dest>"
     */
    case filesMv(arguments: ArgumentsFilesMvModel)
    /*
     Read a file in a given mfs.
     This endpoint returns a `text/plain` response body.
     curl "http://localhost:5001/api/v0/files/read?arg=<path>&offset=<value>&count=<value>"
     */
    case filesRead(arguments: ArgumentsFilesReadModel)
    /*
     Remove a file.
     This endpoint returns a `text/plain` response body.
     curl "http://localhost:5001/api/v0/files/rm?arg=<path>&recursive=<value>"
     */
    case filesRm(arguments: ArgumentsFilesRmModel)
    /*
     Display file status.
     curl "http://localhost:5001/api/v0/files/stat?arg=<path>&format=<hash> Size: <size> CumulativeSize: <cumulsize> ChildBlocks: <childs> Type: <type>&hash=false&size=false"
     */
    case filesStat(arguments: ArgumentsFilesStatModel)
    /*
     Write to a mutable file in a given filesystem.
     Argument “data” is of file type. This endpoint expects a file in the body of the request as ‘multipart/form-data’.
     curl -F file=@myfile "http://localhost:5001/api/v0/files/write?arg=<path>&offset=<value>&create=<value>&truncate=<value>&count=<value>""
     */
    case filesWrite(file: Data, arguments: ArgumentsFilesWriteModel)
    /*
     List blocks that are both in the filestore and standard block storage.
     curl "http://localhost:5001/api/v0/filestore/dups"
     */
    case filestoreDups()
    /*
     List objects in filestore.
     curl "http://localhost:5001/api/v0/filestore/ls?arg=<obj>&file-order=<value>"
     */
    case filestoreLs(arguments: ArgumentsFilestoreLsModel)
    /*
     Verify objects in filestore.
     curl "http://localhost:5001/api/v0/filestore/verify?arg=<obj>&file-order=<value>"
     */
    case filestoreVerify(arguments: ArgumentsFilestoreVerifyModel)
    /*
     Download IPFS objects.
     This endpoint returns a `text/plain` response body.
     curl "http://localhost:5001/api/v0/get?arg=<ipfs-path>&output=<value>&archive=false&compress=false&compression-level=-1"
     */
    case get(arguments: ArgumentsGetModel)
    /*
     Show ipfs node id info.
     curl "http://localhost:5001/api/v0/id?arg=<peerid>&format=<value>"
     */
    case id(arguments: ArgumentsIdModel)
    /*
     Create a new keypair
     curl "http://localhost:5001/api/v0/key/gen?arg=<name>&type=<value>&size=<value>"
     */
    case keyGen(arguments: ArgumentsKeyGenModel)
    /*
     List all local keypairs
     curl "http://localhost:5001/api/v0/key/list?l=<value>"
     */
    case keyList(l: Bool?)
    /*
     Rename a keypair
     curl "http://localhost:5001/api/v0/key/rename?arg=<name>&arg=<newName>&force=<value>"
     */
    case keyRename(arguments: ArgumentsKeyRenameModel)
    /*
     Remove a keypair
     curl "http://localhost:5001/api/v0/key/rm?arg=<name>&l=<value>"
     */
    case keyRm(arguments: ArgumentsKeyRmModel)
    /*
     Change the logging level.
     curl "http://localhost:5001/api/v0/log/level?arg=<subsystem>&arg=<level>"
     */
    case logLevel(arguments: ArgumentsLogLevelModel)
    /*
     List the logging subsystems.
     curl "http://localhost:5001/api/v0/log/ls"
     */
    case logLs()
    /*
     Read the event log.
     curl "http://localhost:5001/api/v0/log/tail"
     */
    case logTail()
    /*
     List directory contents for Unix filesystem objects.
     curl "http://localhost:5001/api/v0/ls?arg=<ipfs-path>&headers=false&resolve-type=true"
     */
    case ls(arguments: ArgumentsLsModel)
    /*
     Mounts IPFS to the filesystem (read-only).
     curl "http://localhost:5001/api/v0/mount?ipfs-path=<value>&ipns-path=<value>"
     */
    case mount(arguments: ArgumentsMountModel)
    /*
     Publish IPNS names.
     curl "http://localhost:5001/api/v0/name/publish?arg=<ipfs-path>&resolve=true&lifetime=24h&ttl=<value>&key=self"
     */
    case namePublish(arguments: ArgumentsNamePublishModel)
    /*
     Resolve IPNS names.
     curl "http://localhost:5001/api/v0/name/resolve?arg=<name>&recursive=false&nocache=false"
     */
    case nameResolve(arguments: ArgumentsNameResolveModel)
    /*
     Output the raw bytes of an IPFS object.
     curl "http://localhost:5001/api/v0/object/data?arg=<key>"
     */
    case objectData(key: String)
    /*
     Display the diff between two ipfs objects.
     curl "http://localhost:5001/api/v0/object/diff?arg=<obj_a>&arg=<obj_b>&verbose=<value>"
     */
    case objectDiff(arguments: ArgumentsObjectDiffModel)
    /*
     Get and serialize the DAG node named by .
     curl "http://localhost:5001/api/v0/object/get?arg=<key>"
     */
    case objectGet(key: String)
    /*
     Output the links pointed to by the specified object.
     curl "http://localhost:5001/api/v0/object/links?arg=<key>&headers=false"
     */
    case objectLinks(arguments: ArgumentsObjectLinksModel)
    /*
     Create a new object from an ipfs template.
     curl "http://localhost:5001/api/v0/object/new?arg=<template>"
     */
    case objectNew(template: String?)
    /*
     Add a link to a given object.
     curl "http://localhost:5001/api/v0/object/patch/add-link?arg=<root>&arg=<name>&arg=<ref>&create=false"
     */
    case objectPatchAddLink(arguments: ArgumentsObjectPatchAddLinkModel)
    /*
     Append data to the data segment of a dag node.
     Argument “data” is of file type. This endpoint expects a file in the body of the request as ‘multipart/form-data’.
     curl -F file=@myfile "http://localhost:5001/api/v0/object/patch/append-data?arg=<root>"
     */
    case objectPatchAppendData(file: Data, root: String)
    /*
     Remove a link from an object.
     curl "http://localhost:5001/api/v0/object/patch/rm-link?arg=<root>&arg=<link>"
     */
    case objectPatchRmLink(arguments: ArgumentsObjectPatchRmLinkModel)
    /*
     Set the data field of an IPFS object.
     Argument “data” is of file type. This endpoint expects a file in the body of the request as ‘multipart/form-data’.
     curl -F file=@myfile "http://localhost:5001/api/v0/object/patch/set-data?arg=<root>"
     */
    case objectPatchSetData(file: Data, root: String)
    /*
     Store input as a DAG object, print its key.
     Argument “data” is of file type. This endpoint expects a file in the body of the request as ‘multipart/form-data’.
     curl -F file=@myfile "http://localhost:5001/api/v0/object/put?inputenc=json&datafieldenc=text&pin=false"
     */
    case objectPut(file: Data, arguments: ArgumentsObjectPutModel?)
    /*
     Get stats for the DAG node named by .
     curl "http://localhost:5001/api/v0/object/stat?arg=<key>"
     */
    case objectStat(key: String)
    /*
     Close active p2p listener.
     curl "http://localhost:5001/api/v0/p2p/listener/close?arg=<Protocol>&all=false"
     */
    case p2pListenerClose(arguments: ArgumentsP2pListenerCloseModel)
    /*
     List active p2p listeners.
     curl "http://localhost:5001/api/v0/p2p/listener/ls?headers=false"
     */
    case p2pListenerLs(headers: Bool?)
    /*
     Forward p2p connections to a network multiaddr.
     curl "http://localhost:5001/api/v0/p2p/listener/open?arg=<Protocol>&arg=<Address>"
     */
    case p2pListenerOpen(arguments: ArgumentsP2pListenerOpenModel)
    /*
     Close active p2p stream.
     curl "http://localhost:5001/api/v0/p2p/stream/close?arg=<HandlerID>&all=false"
     */
    case p2pStreamClose(arguments: ArgumentsP2pStreamCloseModel)
    /*
     Dial to a p2p listener.
     curl "http://localhost:5001/api/v0/p2p/stream/dial?arg=<Peer>&arg=<Protocol>&arg=<BindAddress>"
     */
    case p2pStreamDial(arguments: ArgumentsP2pStreamDialModel)
    /*
     List active p2p streams.
     curl "http://localhost:5001/api/v0/p2p/stream/ls?headers=false"
     */
    case p2pStreamLs(headers: Bool?)
    /*
     Pin objects to local storage.
     curl "http://localhost:5001/api/v0/pin/add?arg=<ipfs-path>&recursive=true&progress=<value>"
     */
    case pinAdd(arguments: ArgumentsPinAddModel)
    /*
     List objects pinned to local storage.
     curl "http://localhost:5001/api/v0/pin/ls?arg=<ipfs-path>&type=all&quiet=false"
     */
    case pinLs(arguments: ArgumentsPinLsModel)
    /*
     Remove pinned objects from local storage.
     curl "http://localhost:5001/api/v0/pin/rm?arg=<ipfs-path>&recursive=true"
     */
    case pinRm(arguments: ArgumentsPinRmModel)
    /*
     Update a recursive pin
     curl "http://localhost:5001/api/v0/pin/update?arg=<from-path>&arg=<to-path>&unpin=true"
     */
    case pinUpdate(arguments: ArgumentsPinUpdateModel)
    /*
     Verify that recursive pins are complete.
     curl "http://localhost:5001/api/v0/pin/verify?verbose=<value>&quiet=<value>"
     */
    case pinVerify(arguments: ArgumentsPinVerifyModel)
    /*
     Send echo request packets to IPFS hosts.
     curl "http://localhost:5001/api/v0/ping?arg=<peer ID>&count=10"
     */
    case ping(arguments: ArgumentsPingModel)
    /*
     List subscribed topics by name.
     curl "http://localhost:5001/api/v0/pubsub/ls"
     */
    case pubsubLs()
    /*
     List peers we are currently pubsubbing with.
     curl "http://localhost:5001/api/v0/pubsub/peers?arg=<topic>"
     */
    case pubsubPeers(topic: String?)
    /*
     Publish a message to a given pubsub topic.
     This endpoint returns a `text/plain` response body.
     curl "http://localhost:5001/api/v0/pubsub/pub?arg=<topic>&arg=<data>"
     */
    case pubsubPub(arguments: ArgumentsPubsubPubModel)
    /*
     Subscribe to messages on a given topic.
     curl "http://localhost:5001/api/v0/pubsub/sub?arg=<topic>&discover=<value>"
     */
    case pubsubSub(arguments: ArgumentsPubsubSubModel)
    /*
     List all local references.
     curl "http://localhost:5001/api/v0/refs/local"
     */
    case refsLocal()
    /*
     Remove repo lockfiles.
     curl "http://localhost:5001/api/v0/repo/fsck"
     */
    case repoFsck()
    /*
     Perform a garbage collection sweep on the repo.
     curl "http://localhost:5001/api/v0/repo/gc?quiet=false&stream-errors=false"
     */
    case repoGc(arguments: ArgumentsRepoGcModel)
    /*
     Get stats for the currently used repo.
     curl "http://localhost:5001/api/v0/repo/stat?human=false"
     */
    case repoStat(human: Bool?)
    /*
     Verify all blocks in repo are not corrupted.
     curl "http://localhost:5001/api/v0/repo/verify"
     */
    case repoVerify()
    /*
     Show the repo version.
     curl "http://localhost:5001/api/v0/repo/version?quiet=<value>"
     */
    case repoVersion(quiet: Bool?)
    /*
     Resolve the value of names to IPFS.
     curl "http://localhost:5001/api/v0/resolve?arg=<name>&recursive=false"
     */
    case resolve(arguments: ArgumentsResolveModel)
    /*
     Shut down the ipfs daemon
     This endpoint returns a `text/plain` response body.
     curl "http://localhost:5001/api/v0/shutdown"
     */
    case shutdown()
    /*
     Show some diagnostic information on the bitswap agent.
     curl "http://localhost:5001/api/v0/stats/bitswap"
     */
    case statsBitswap()
    /*
     Print ipfs bandwidth information.
     curl "http://localhost:5001/api/v0/stats/bw?peer=<value>&proto=<value>&poll=false&interval=1s"
     */
    case statsBw(arguments: ArgumentsStatsBwModel)
    /*
     Get stats for the currently used repo.
     curl "http://localhost:5001/api/v0/stats/repo?human=false"
     */
    case statsRepo(human: Bool?)
    /*
     List interface listening addresses.
     curl "http://localhost:5001/api/v0/swarm/addrs/listen"
     */
    case swarmAddrsListen()
    /*
     List local addresses.
     curl "http://localhost:5001/api/v0/swarm/addrs/local?id=false"
     */
    case swarmAddrsLocal(id: Bool?)
    /*
     Open connection to a given address.
     curl "http://localhost:5001/api/v0/swarm/connect?arg=<address>"
     */
    case swarmConnect(address: String)
    /*
     Close connection to a given address.
     curl "http://localhost:5001/api/v0/swarm/disconnect?arg=<address>"
     */
    case swarmDisconnect(address: String)
    /*
     Add an address filter.
     curl "http://localhost:5001/api/v0/swarm/filters/add?arg=<address>"
     */
    case swarmFiltersAdd(address: String)
    /*
     Remove an address filter.
     curl "http://localhost:5001/api/v0/swarm/filters/rm?arg=<address>"
     */
    case swarmFiltersRm(address: String)
    /*
     List peers with open connections.
     curl "http://localhost:5001/api/v0/swarm/peers?verbose=<value>&streams=<value>&latency=<value>"
     */
    case swarmPeers(arguments: ArgumentsSwarmPeersModel)
    /*
     Import a tar file into ipfs.
     curl -F file=@myfile "http://localhost:5001/api/v0/tar/add"
     */
    case tarAdd(file: Data)
    /*
     Export a tar file from IPFS.
     This endpoint returns a `text/plain` response body.
     curl "http://localhost:5001/api/v0/tar/cat?arg=<path>"
     */
    case tarCat(path: String)
    /*
     This endpoint returns a `text/plain` response body.
     curl "http://localhost:5001/api/v0/update?arg=<args>"
     */
    case update(args: String?)
    /*
     Show ipfs version information.
     curl "http://localhost:5001/api/v0/version?number=false&commit=false&repo=false&all=false"
     */
    case version(arguments: ArgumentsVersionModel)
}

extension IAService: TargetType {
    
    var baseURL: URL {
        return URL(string: Ipfs.shared().baseAddress)!
    }
    
    var path: String {
        switch self {
        case .add:
            return "/add"
        case .bitswapLedger:
            return "/bitswap/ledger"
        case .bitswapReprovide:
            return "/bitswap/reprovide"
        case .bitswapStat:
            return "/bitswap/stat"
        case .bitswapUnwant:
            return "/bitswap/unwant"
        case .bitswapWantlist:
            return "/bitswap/wantlist"
        case .blockGet:
            return "/block/get"
        case .blockPut:
            return "/block/put"
        case .blockRm:
            return "/block/rm"
        case .blockStat:
            return "/block/stat"
        case .bootstrapAddDefault:
            return "/bootstrap/add/default"
        case .bootstrapList:
            return "/bootstrap/list"
        case .bootstrapRmAll:
            return "/bootstrap/rm/all"
        case .cat:
            return "/cat"
        case .commands:
            return "/commands"
        case .configEdit:
            return "/config/edit"
        case .configReplace:
            return "/config/replace"
        case .configShow:
            return "/config/show"
        case .dagGet:
            return "/dag/get"
        case .dagPut:
            return "/dag/put"
        case .dagResolve:
            return "/dag/resolve"
        case .dhtFindpeer:
            return "/dht/findpeer"
        case .dhtFindprovs:
            return "/dht/findprovs"
        case .dhtGet:
            return "/dht/get"
        case .dhtProvide:
            return "/dht/provide"
        case .dhtPut:
            return "/dht/put"
        case .dhtQuery:
            return "/dht/query"
        case .diagCmdsClear:
            return "/diag/cmds/clear"
        case .diagCmdsSetTime:
            return "/diag/cmds/set-time"
        case .diagSys:
            return "/diag/sys"
        case .dns:
            return "/dns"
        case .fileLs:
            return "/file/ls"
        case .filesCp:
            return "/files/cp"
        case .filesFlush:
            return "/files/flush"
        case .filesLs:
            return "/files/ls"
        case .filesMkdir:
            return "/files/mkdir"
        case .filesMv:
            return "/files/mv"
        case .filesRead:
            return "/files/read"
        case .filesRm:
            return "/files/rm"
        case .filesStat:
            return "/files/stat"
        case .filesWrite:
            return "/files/write"
        case .filestoreDups:
            return "/filestore/dups"
        case .filestoreLs:
            return "/filestore/ls"
        case .filestoreVerify:
            return "/filestore/verify"
        case .get:
            return "/get"
        case .id:
            return "/id"
        case .keyGen:
            return "/key/gen"
        case .keyList:
            return "/key/list"
        case .keyRename:
            return "/key/rename"
        case .keyRm:
            return "/key/rm"
        case .logLevel:
            return "/log/level"
        case .logLs:
            return "/log/ls"
        case .logTail:
            return "/log/tail"
        case .ls:
            return "/ls"
        case .mount:
            return "/mount"
        case .namePublish:
            return "/name/publish"
        case .nameResolve:
            return "/name/resolve"
        case .objectData:
            return "/object/data"
        case .objectDiff:
            return "object/diff"
        case .objectGet:
            return "/object/get"
        case .objectLinks:
            return "/object/links"
        case .objectNew:
            return "/object/new"
        case .objectPatchAddLink:
            return "/object/patch/add-link"
        case .objectPatchAppendData:
            return "/object/patch/append-data"
        case .objectPatchRmLink:
            return "/object/patch/rm-link"
        case .objectPatchSetData:
            return "/object/patch/set-data"
        case .objectPut:
            return "/object/put"
        case .objectStat:
            return "/object/stat"
        case .p2pListenerClose:
            return "/p2p/listener/close"
        case .p2pListenerLs:
            return "/p2p/listener/ls"
        case .p2pListenerOpen:
            return "/p2p/listener/open"
        case .p2pStreamClose:
            return "/p2p/stream/close"
        case .p2pStreamDial:
            return "/p2p/stream/dial"
        case .p2pStreamLs:
            return "/p2p/stream/ls"
        case .pinAdd:
            return "/pin/add"
        case .pinLs:
            return "/pin/ls"
        case .pinRm:
            return "/pin/rm"
        case .pinUpdate:
            return "/pin/update"
        case .pinVerify:
            return "/pin/verify"
        case .ping:
            return "/ping"
        case .pubsubLs:
            return "/pubsub/ls"
        case .pubsubPeers:
            return "/pubsub/peers"
        case .pubsubPub:
            return "/pubsub/pub"
        case .pubsubSub:
            return "/pubsub/sub"
        case .refsLocal:
            return "/refs/local"
        case .repoFsck:
            return "/repo/fsck"
        case .repoGc:
            return "/repo/gc"
        case .repoStat:
            return "/repo/stat"
        case .repoVerify:
            return "/repo/verify"
        case .repoVersion:
            return "/repo/version"
        case .resolve:
            return "/resolve"
        case .shutdown:
            return "/shutdown"
        case .statsBitswap:
            return "/stats/bitswap"
        case .statsBw:
            return "/stats/bw"
        case .statsRepo:
            return "/stats/repo"
        case .swarmAddrsListen:
            return "/swarm/addrs/listen"
        case .swarmAddrsLocal:
            return "/swarm/addrs/local"
        case .swarmConnect:
            return "/swarm/connect"
        case .swarmDisconnect:
            return "/swarm/disconnect"
        case .swarmFiltersAdd:
            return "/swarm/filters/add"
        case .swarmFiltersRm:
            return "/swarm/filters/rm"
        case .swarmPeers:
            return "/swarm/peers"
        case .tarAdd:
            return "/tar/add"
        case .tarCat:
            return "/tar/cat"
        case .update:
            return "/update"
        case .version:
            return "/version"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .add:
            return .post
        case .bitswapLedger:
            return .get
        case .bitswapReprovide:
            return .get
        case .bitswapStat:
            return .get
        case .bitswapUnwant:
            return .get
        case .bitswapWantlist:
            return .get
        case .blockGet:
            return .get
        case .blockPut:
            return .post
        case .blockRm:
            return .get
        case .blockStat:
            return .get
        case .bootstrapAddDefault:
            return .get
        case .bootstrapList:
            return .get
        case .bootstrapRmAll:
            return .get
        case .cat:
            return .get
        case .commands:
            return .get
        case .configEdit:
            return .get
        case .configReplace:
            return .post
        case .configShow:
            return .get
        case .dagGet:
            return .get
        case .dagPut:
            return .post
        case .dagResolve:
            return .get
        case .dhtFindpeer:
            return .get
        case .dhtFindprovs:
            return .get
        case .dhtGet:
            return .get
        case .dhtProvide:
            return .get
        case .dhtPut:
            return .get
        case .dhtQuery:
            return .get
        case .diagCmdsClear:
            return .get
        case .diagCmdsSetTime:
            return .get
        case .diagSys:
            return .get
        case .dns:
            return .get
        case .fileLs:
            return .get
        case .filesCp:
            return .get
        case .filesFlush:
            return .get
        case .filesLs:
            return .get
        case .filesMkdir:
            return .get
        case .filesMv:
            return .get
        case .filesRead:
            return .get
        case .filesRm:
            return .get
        case .filesStat:
            return .get
        case .filesWrite:
            return .post
        case .filestoreDups:
            return .get
        case .filestoreLs:
            return .get
        case .filestoreVerify:
            return .get
        case .get:
            return .get
        case .id:
            return .get
        case .keyGen:
            return .get
        case .keyList:
            return .get
        case .keyRename:
            return .get
        case .keyRm:
            return .get
        case .logLevel:
            return .get
        case .logLs:
            return .get
        case .logTail:
            return .get
        case .ls:
            return .get
        case .mount:
            return .get
        case .namePublish:
            return .get
        case .nameResolve:
            return .get
        case .objectData:
            return .get
        case .objectDiff:
            return .get
        case .objectGet:
            return .get
        case .objectLinks:
            return .get
        case .objectNew:
            return .get
        case .objectPatchAddLink:
            return .get
        case .objectPatchAppendData:
            return .post
        case .objectPatchRmLink:
            return .get
        case .objectPatchSetData:
            return .post
        case .objectPut:
            return .post
        case .objectStat:
            return .get
        case .p2pListenerClose:
            return .get
        case .p2pListenerLs:
            return .get
        case .p2pListenerOpen:
            return .get
        case .p2pStreamClose:
            return .get
        case .p2pStreamDial:
            return .get
        case .p2pStreamLs:
            return .get
        case .pinAdd:
            return .get
        case .pinLs:
            return .get
        case .pinRm:
            return .get
        case .pinUpdate:
            return .get
        case .pinVerify:
            return .get
        case .ping:
            return .get
        case .pubsubLs:
            return .get
        case .pubsubPeers:
            return .get
        case .pubsubPub:
            return .get
        case .pubsubSub:
            return .get
        case .refsLocal:
            return .get
        case .repoFsck:
            return .get
        case .repoGc:
            return .get
        case .repoStat:
            return .get
        case .repoVerify:
            return .get
        case .repoVersion:
            return .get
        case .resolve:
            return .get
        case .shutdown:
            return .get
        case .statsBitswap:
            return .get
        case .statsBw:
            return .get
        case .statsRepo:
            return .get
        case .swarmAddrsListen:
            return .get
        case .swarmAddrsLocal:
            return .get
        case .swarmConnect:
            return .get
        case .swarmDisconnect:
            return .get
        case .swarmFiltersAdd:
            return .get
        case .swarmFiltersRm:
            return .get
        case .swarmPeers:
            return .get
        case .tarAdd:
            return .post
        case .tarCat:
            return .get
        case .update:
            return .get
        case .version:
            return .get
        }
    }
    
    var sampleData: Data {
       return "{}".utf8Encoded
    }
    
    var task: Task {
        switch self {
        case .add(let file, let arguments):
            let data = MultipartFormData(provider: MultipartFormData.FormDataProvider.data(file), name: "file")
            return .uploadCompositeMultipart([data], urlParameters: arguments.toDictionary())
        case .bitswapLedger(let peer):
            return .requestParameters(parameters: ["arg":peer], encoding: URLEncoding.queryString)
//            return .requestPlain
        case .bitswapReprovide:
            return .requestPlain
        case .bitswapStat:
            return .requestPlain
        case .bitswapUnwant(let key):
            return .requestParameters(parameters: ["arg":key], encoding: URLEncoding.queryString)
        case .bitswapWantlist(let peer):
            return .requestParameters(parameters: ["peer":peer], encoding: URLEncoding.queryString)
        case .blockGet(let key):
            return .requestParameters(parameters: ["arg":key], encoding: URLEncoding.queryString)
        case .blockPut(let file, let arguments):
            let data = MultipartFormData(provider: MultipartFormData.FormDataProvider.data(file), name: "file")
            return .uploadCompositeMultipart([data], urlParameters: arguments.toDictionary())
        case .blockRm(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .blockStat(let key):
            return .requestParameters(parameters: ["arg":key], encoding: URLEncoding.queryString)
        case .bootstrapAddDefault:
            return .requestPlain
        case .bootstrapList:
            return .requestPlain
        case .bootstrapRmAll:
            return .requestPlain
        case .cat(let ipfsPath):
            return .requestParameters(parameters: ["arg":ipfsPath], encoding: URLEncoding.queryString)
        case .commands(let flags):
            guard let flags = flags else { return .requestPlain }
            return .requestParameters(parameters: ["flags":flags], encoding: URLEncoding.queryString)
        case .configEdit:
            return .requestPlain
        case .configReplace(let file):
            let data = MultipartFormData(provider: MultipartFormData.FormDataProvider.data(file), name: "file")
            return .uploadMultipart([data])
        case .configShow:
            return .requestPlain
        case .dagGet(let ref):
            return .requestParameters(parameters: ["arg":ref], encoding: URLEncoding.queryString)
        case .dagPut(let file, let arguments):
            let data = MultipartFormData(provider: MultipartFormData.FormDataProvider.data(file), name: "file")
            return .uploadCompositeMultipart([data], urlParameters: arguments.toDictionary())
        case .dagResolve(let ref):
            return .requestParameters(parameters: ["arg":ref], encoding: URLEncoding.queryString)
        case .dhtFindpeer(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .dhtFindprovs(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .dhtGet(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .dhtProvide(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .dhtPut(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .dhtQuery(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .diagCmdsClear:
            return .requestPlain
        case .diagCmdsSetTime(let time):
            return .requestParameters(parameters: ["arg":time], encoding: URLEncoding.queryString)
        case .diagSys:
            return .requestPlain
        case .dns(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .fileLs(let ipfsPath):
            return .requestParameters(parameters: ["arg":ipfsPath], encoding: URLEncoding.queryString)
        case .filesCp(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .filesFlush(let path):
            guard let path = path else { return .requestPlain }
            return .requestParameters(parameters: ["arg":path], encoding: URLEncoding.queryString)
        case .filesLs(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .filesMkdir(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .filesMv(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .filesRead(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .filesRm(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .filesStat(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .filesWrite(let file, let arguments):
            let data = MultipartFormData(provider: MultipartFormData.FormDataProvider.data(file), name: "file")
            return .uploadCompositeMultipart([data], urlParameters: arguments.toDictionary())
        case .filestoreDups:
            return .requestPlain
        case .filestoreLs(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .filestoreVerify(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .get(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .id(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .keyGen(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .keyList(let l):
            guard let l = l else { return .requestPlain }
            return .requestParameters(parameters: ["l":l], encoding: URLEncoding.queryString)
        case .keyRename(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .keyRm(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .logLevel(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .logLs:
            return .requestPlain
        case .logTail:
            return .requestPlain
        case .ls(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .mount(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .namePublish(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .nameResolve(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .objectData(let key):
            return .requestParameters(parameters: ["arg":key], encoding: URLEncoding.queryString)
        case .objectDiff(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .objectGet(let key):
            return .requestParameters(parameters: ["arg":key], encoding: URLEncoding.queryString)
        case .objectLinks(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .objectNew(let template):
            guard let template = template else { return .requestPlain }
            return .requestParameters(parameters: ["arg":template], encoding: URLEncoding.queryString)
        case .objectPatchAddLink(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .objectPatchAppendData(let file, let root):
            let data = MultipartFormData(provider: MultipartFormData.FormDataProvider.data(file), name: "file")
            return .uploadCompositeMultipart([data], urlParameters: ["arg": root])
        case .objectPatchRmLink(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .objectPatchSetData(let file, let root):
            let data = MultipartFormData(provider: MultipartFormData.FormDataProvider.data(file), name: "file")
            return .uploadCompositeMultipart([data], urlParameters: ["arg": root])
        case .objectPut(let file, let arguments):
            let data = MultipartFormData(provider: MultipartFormData.FormDataProvider.data(file), name: "file")
            return .uploadCompositeMultipart([data], urlParameters: arguments.toDictionary())
        case .objectStat(let key):
            return .requestParameters(parameters: ["arg":key], encoding: URLEncoding.queryString)
        case .p2pListenerClose(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .p2pListenerLs(let headers):
            guard let headers = headers else { return .requestPlain }
            return .requestParameters(parameters: ["headers":headers], encoding: URLEncoding.queryString)
        case .p2pListenerOpen(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .p2pStreamClose(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .p2pStreamDial(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .p2pStreamLs(let headers):
            guard let headers = headers else { return .requestPlain }
            return .requestParameters(parameters: ["headers":headers], encoding: URLEncoding.queryString)
        case .pinAdd(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .pinLs(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .pinRm(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .pinUpdate(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .pinVerify(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .ping(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .pubsubLs:
            return .requestPlain
        case .pubsubPeers(let topic):
            guard let topic = topic else { return .requestPlain }
            return .requestParameters(parameters: ["arg":topic], encoding: URLEncoding.queryString)
        case .pubsubPub(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .pubsubSub(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .refsLocal:
            return .requestPlain
        case .repoFsck:
            return .requestPlain
        case .repoGc(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .repoStat(let human):
            guard let human = human else { return .requestPlain }
            return .requestParameters(parameters: ["human":human], encoding: URLEncoding.queryString)
        case .repoVerify:
            return .requestPlain
        case .repoVersion(let quiet):
            guard let quiet = quiet else { return .requestPlain }
            return .requestParameters(parameters: ["quiet":quiet], encoding: URLEncoding.queryString)
        case .resolve(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .shutdown:
            return .requestPlain
        case .statsBitswap:
            return .requestPlain
        case .statsBw(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .statsRepo(let human):
            guard let human = human else { return .requestPlain }
            return .requestParameters(parameters: ["human":human], encoding: URLEncoding.queryString)
        case .swarmAddrsListen:
            return .requestPlain
        case .swarmAddrsLocal(let id):
            guard let id = id else { return .requestPlain }
            return .requestParameters(parameters: ["id":id], encoding: URLEncoding.queryString)
        case .swarmConnect(let address):
            return .requestParameters(parameters: ["arg":address], encoding: URLEncoding.queryString)
        case .swarmDisconnect(let address):
            return .requestParameters(parameters: ["arg":address], encoding: URLEncoding.queryString)
        case .swarmFiltersAdd(let address):
            return .requestParameters(parameters: ["arg":address], encoding: URLEncoding.queryString)
        case .swarmFiltersRm(let address):
            return .requestParameters(parameters: ["arg":address], encoding: URLEncoding.queryString)
        case .swarmPeers(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        case .tarAdd(let file):
            let data = MultipartFormData(provider: MultipartFormData.FormDataProvider.data(file), name: "file")
            return .uploadMultipart([data])
        case .tarCat(let path):
            return .requestParameters(parameters: ["arg":path], encoding: URLEncoding.queryString)
        case .update(let args):
            guard let args = args else { return .requestPlain }
            return .requestParameters(parameters: ["arg":args], encoding: URLEncoding.queryString)
        case .version(let arguments):
            return .requestParameters(parameters: arguments.toDictionary(), encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-type": "application/json"]
        }
        
    }
}

// MARK: - Helpers
fileprivate extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

fileprivate extension Dictionary {
    var jsonData: Data {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        } catch {
            return Data()
        }
    }
}

fileprivate extension Array {
    var jsonData: Data {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        } catch {
            return Data()
        }
    }
}


fileprivate extension Encodable {
    func toDictionary() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                throw NSError()
            }
            return dictionary
        } catch {
            return [String: Any]()
        }
    }
}
