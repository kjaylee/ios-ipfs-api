//
//  ArgumentsAddModel.swift
//  Alamofire
//
//  Created by we on 2018. 8. 17..
//

import Foundation

public struct ArgumentsAddModel: Codable {
//    recursive [bool]: Add directory paths recursively. Default: “false”. Required: no.
    let recursive: Bool?
//    quiet [bool]: Write minimal output. Required: no.
    let quiet: Bool?
//    quieter [bool]: Write only final hash. Required: no.
    let quieter: Bool?
//    silent [bool]: Write no output. Required: no.
    let silent: Bool?
//    progress [bool]: Stream progress data. Required: no.
    let progress: Bool?
//    trickle [bool]: Use trickle-dag format for dag generation. Required: no.
    let triclke: Bool?
//    only-hash [bool]: Only chunk and hash - do not write to disk. Required: no.
    let onlyHash: Bool?
//    wrap-with-directory [bool]: Wrap files with a directory object. Required: no.
    let wrapWithDirectory: Bool?
//    hidden [bool]: Include files that are hidden. Only takes effect on recursive add. Required: no.
    let hidden: Bool?
//    chunker [string]: Chunking algorithm to use. Required: no.
    let chunker: String?
//    pin [bool]: Pin this object when adding. Default: “true”. Required: no.
    let pin: Bool?
//    raw-leaves [bool]: Use raw blocks for leaf nodes. (experimental). Required: no.
    let rawLeaves: Bool?
//    nocopy [bool]: Add the file using filestore. (experimental). Required: no.
    let nocopy: Bool?
//    fscache [bool]: Check the filestore for pre-existing blocks. (experimental). Required: no.
    let fscache: Bool?
//    cid-version [int]: Cid version. Non-zero value will change default of ‘raw-leaves’ to true. (experimental). Default: “0”. Required: no.
    let cidVersion: Int?
//    hash [string]: Hash function to use. Will set Cid version to 1 if used. (experimental). Default: “sha2-256”. Required: no.
    let hash: String?
    
    init(recursive: Bool? = nil,
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
         hash: String? = nil
         ) {
        self.recursive = recursive
        self.quiet = quiet
        self.quieter = quieter
        self.silent = silent
        self.progress = progress
        self.triclke = triclke
        self.onlyHash = onlyHash
        self.wrapWithDirectory = wrapWithDirectory
        self.hidden = hidden
        self.chunker = chunker
        self.pin = pin
        self.rawLeaves = rawLeaves
        self.nocopy = nocopy
        self.fscache = fscache
        self.cidVersion = cidVersion
        self.hash = hash
    }
    
    enum CodingKeys: String, CodingKey {
        case recursive
        case quiet
        case quieter
        case silent
        case progress
        case triclke
        case onlyHash = "only-hash"
        case wrapWithDirectory = "wrap-with-directory"
        case hidden
        case chunker
        case pin
        case rawLeaves = "raw-leaves"
        case nocopy
        case fscache
        case cidVersion = "cid-version"
        case hash
    }
}
