//
//  IAService.swift
//  ipfs-api service
//
//  Created by Jay on 2018. 4. 25..
//  Copyright © 2018년 Jay All rights reserved.
//
// ipfs-api service
import Foundation
import Moya

enum IAService {
    /*
        Add a file or directory to ipfs.
     Argument “path” is of file type. This endpoint expects a file in the body of the request as ‘multipart/form-data’.
        curl -F file=@myfile "http://localhost:5001/api/v0/add?recursive=false&quiet=<value>&quieter=<value>&silent=<value>&progress=<value>&trickle=<value>&only-hash=<value>&wrap-with-directory=<value>&hidden=<value>&chunker=<value>&pin=true&raw-leaves=<value>&nocopy=<value>&fscache=<value>&cid-version=0&hash=sha2-256"
    */
    case add(arguments: ArgumentsAddModel)
    /*
         Show the current ledger for a peer.
         curl "http://localhost:5001/api/v0/bitswap/ledger?arg=<peer>"
     */
    case bitswapLedger(peerID: String)
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
    case blockGet(hash: String)
    /*
     Store input as an IPFS block.
     curl -F file=@myfile "http://localhost:5001/api/v0/block/put?format=v0&mhtype=sha2-256&mhlen=-1"
     */
    case blockPut(arguments: ArgumentsBlockPutModel)
    /*
     Remove IPFS block(s).
     curl "http://localhost:5001/api/v0/block/rm?arg=<hash>&force=false&quiet=false"
     */
    case blockRm(arguments: ArgumentsBlockRmModel)
    /*
     Print information of a raw IPFS block.
     curl "http://localhost:5001/api/v0/block/stat?arg=<key>"
     */
    case blockStat(hash: String)
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
    case cat(path: String)
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
    case configReplace(arg: String)
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
    case dagPut(arguments: ArgumentsDagPutModel)
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
    case dhtFindprovs
    case dhtGet
    case dhtProvide
    case dhtPut
    case dhtQuery
    case diagCmdsClear
    case diagCmdsSetTime
    case diagSys
    case dns
    case fileLs
    case filesCp
    case filesFlush
    case filesLs
    case filesMkdir
    case filesMv
    case filesRead
    case filesRm
    case filesStat
    case filesWrite
    case filestoreDups
    case filestoreLs
    case filestoreVerify
    case get
    case id
    case keyGen
    case keyList
    case keyRename
    case keyRm
    case logLevel
    case logLs
    case logTail
    case ls
    case mount
    case namePublish
    case nameResolve
    case objectData
    case objectDiff
    case objectGet
    case objectLinks
    case objectNew
    case objectPatchAddLink
    case objectPatchAppendData
    case objectPatchRmLink
    case objectPatchSetData
    case objectPut
    case objectStat
    case p2pListenerClose
    case p2pListenerLs
    case p2pListenerOpen
    case p2pStreamClose
    case p2pStreamDial
    case p2pStreamLs
    case pinAdd
    case pinLs
    case pinRm
    case pinUpdate
    case pinVerify
    case ping
    case pubsubLs
    case pubsubPeers
    case pubsubPub
    case pubsubSub
    case refsLocal
    case repoFsck
    case repoGc
    case repoStat
    case repoVerify
    case repoVersion
    case resolve
    case shutdown
    case statsBitswap
    case statsBw
    case statsRepo
    case swarmAddrsListen
    case swarmAddrsLocal
    case swarmConnect
    case swarmDisconnect
    case swarmFiltersAdd
    case swarmFiltersRm
    case swarmPeers
    case tarAdd
    case tarCat
    case update
    case version
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
            <#code#>
        case .bitswapStat:
            <#code#>
        case .bitswapUnwant:
            <#code#>
        case .bitswapWantlist:
            <#code#>
        case .blockGet:
            <#code#>
        case .blockPut:
            <#code#>
        case .blockRm:
            <#code#>
        case .blockStat:
            <#code#>
        case .bootstrapAddDefault:
            <#code#>
        case .bootstrapList:
            <#code#>
        case .bootstrapRmAll:
            <#code#>
        case .cat:
            <#code#>
        case .commands:
            <#code#>
        case .configEdit:
            <#code#>
        case .configReplace:
            <#code#>
        case .configShow:
            <#code#>
        case .dagGet:
            <#code#>
        case .dagPut:
            <#code#>
        case .dagResolve:
            <#code#>
        case .dhtFindpeer:
            <#code#>
        case .dhtFindprovs:
            <#code#>
        case .dhtGet:
            <#code#>
        case .dhtProvide:
            <#code#>
        case .dhtPut:
            <#code#>
        case .dhtQuery:
            <#code#>
        case .diagCmdsClear:
            <#code#>
        case .diagCmdsSetTime:
            <#code#>
        case .diagSys:
            <#code#>
        case .dns:
            <#code#>
        case .fileLs:
            <#code#>
        case .filesCp:
            <#code#>
        case .filesFlush:
            <#code#>
        case .filesLs:
            <#code#>
        case .filesMkdir:
            <#code#>
        case .filesMv:
            <#code#>
        case .filesRead:
            <#code#>
        case .filesRm:
            <#code#>
        case .filesStat:
            <#code#>
        case .filesWrite:
            <#code#>
        case .filestoreDups:
            <#code#>
        case .filestoreLs:
            <#code#>
        case .filestoreVerify:
            <#code#>
        case .get:
            <#code#>
        case .id:
            <#code#>
        case .keyGen:
            <#code#>
        case .keyList:
            <#code#>
        case .keyRename:
            <#code#>
        case .keyRm:
            <#code#>
        case .logLevel:
            <#code#>
        case .logLs:
            <#code#>
        case .logTail:
            <#code#>
        case .ls:
            <#code#>
        case .mount:
            <#code#>
        case .namePublish:
            <#code#>
        case .nameResolve:
            <#code#>
        case .objectData:
            <#code#>
        case .objectDiff:
            <#code#>
        case .objectGet:
            <#code#>
        case .objectLinks:
            <#code#>
        case .objectNew:
            <#code#>
        case .objectPatchAddLink:
            <#code#>
        case .objectPatchAppendData:
            <#code#>
        case .objectPatchRmLink:
            <#code#>
        case .objectPatchSetData:
            <#code#>
        case .objectPut:
            <#code#>
        case .objectStat:
            <#code#>
        case .p2pListenerClose:
            <#code#>
        case .p2pListenerLs:
            <#code#>
        case .p2pListenerOpen:
            <#code#>
        case .p2pStreamClose:
            <#code#>
        case .p2pStreamDial:
            <#code#>
        case .p2pStreamLs:
            <#code#>
        case .pinAdd:
            <#code#>
        case .pinLs:
            <#code#>
        case .pinRm:
            <#code#>
        case .pinUpdate:
            <#code#>
        case .pinVerify:
            <#code#>
        case .ping:
            <#code#>
        case .pubsubLs:
            <#code#>
        case .pubsubPeers:
            <#code#>
        case .pubsubPub:
            <#code#>
        case .pubsubSub:
            <#code#>
        case .refsLocal:
            <#code#>
        case .repoFsck:
            <#code#>
        case .repoGc:
            <#code#>
        case .repoStat:
            <#code#>
        case .repoVerify:
            <#code#>
        case .repoVersion:
            <#code#>
        case .resolve:
            <#code#>
        case .shutdown:
            <#code#>
        case .statsBitswap:
            <#code#>
        case .statsBw:
            <#code#>
        case .statsRepo:
            <#code#>
        case .swarmAddrsListen:
            <#code#>
        case .swarmAddrsLocal:
            <#code#>
        case .swarmConnect:
            <#code#>
        case .swarmDisconnect:
            <#code#>
        case .swarmFiltersAdd:
            <#code#>
        case .swarmFiltersRm:
            <#code#>
        case .swarmPeers:
            return .get
        case .tarAdd:
            <#code#>
        case .tarCat:
            <#code#>
        case .update:
            <#code#>
        case .version:
            <#code#>
        }
    }
    
    var sampleData: Data {
       return "{}".utf8Encoded
    }
    
    var task: Task {
        switch self {
        case .add:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
//        case .postMemberLoginResult,
//             .postMemberLoginSalt:
//            return ["Content-type": "application/x-www-form-urlencoded"]
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
