// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Safe Browsing APIs (safebrowsing/v4)
// Description:
//   Enables client applications to check web resources (most commonly URLs)
//   against Google-generated lists of unsafe web resources.
// Documentation:
//   https://developers.google.com/safe-browsing/

#if GTLR_BUILT_AS_FRAMEWORK
  #import "GTLR/GTLRQuery.h"
#else
  #import "GTLRQuery.h"
#endif

#if GTLR_RUNTIME_VERSION != 3000
#error This file was generated by a different version of ServiceGenerator which is incompatible with this GTLR library source.
#endif

@class GTLRSafeBrowsing_FetchThreatListUpdatesRequest;
@class GTLRSafeBrowsing_FindFullHashesRequest;
@class GTLRSafeBrowsing_FindThreatMatchesRequest;

NS_ASSUME_NONNULL_BEGIN

/**
 *  Parent class for other SafeBrowsing query classes.
 */
@interface GTLRSafeBrowsingQuery : GTLRQuery

/** Selector specifying which fields to include in a partial response. */
@property(nonatomic, copy, nullable) NSString *fields;

@end

/**
 *  Finds the full hashes that match the requested hash prefixes.
 *
 *  Method: safebrowsing.fullHashes.find
 */
@interface GTLRSafeBrowsingQuery_FullHashesFind : GTLRSafeBrowsingQuery
// Previous library name was
//   +[GTLQuerySafeBrowsing queryForFullHashesFindWithObject:]

/**
 *  Fetches a @c GTLRSafeBrowsing_FindFullHashesResponse.
 *
 *  Finds the full hashes that match the requested hash prefixes.
 *
 *  @param object The @c GTLRSafeBrowsing_FindFullHashesRequest to include in
 *    the query.
 *
 *  @returns GTLRSafeBrowsingQuery_FullHashesFind
 */
+ (instancetype)queryWithObject:(GTLRSafeBrowsing_FindFullHashesRequest *)object;

@end

/**
 *  Lists the Safe Browsing threat lists available for download.
 *
 *  Method: safebrowsing.threatLists.list
 */
@interface GTLRSafeBrowsingQuery_ThreatListsList : GTLRSafeBrowsingQuery
// Previous library name was
//   +[GTLQuerySafeBrowsing queryForThreatListsList]

/**
 *  Fetches a @c GTLRSafeBrowsing_ListThreatListsResponse.
 *
 *  Lists the Safe Browsing threat lists available for download.
 *
 *  @returns GTLRSafeBrowsingQuery_ThreatListsList
 */
+ (instancetype)query;

@end

/**
 *  Fetches the most recent threat list updates. A client can request updates
 *  for multiple lists at once.
 *
 *  Method: safebrowsing.threatListUpdates.fetch
 */
@interface GTLRSafeBrowsingQuery_ThreatListUpdatesFetch : GTLRSafeBrowsingQuery
// Previous library name was
//   +[GTLQuerySafeBrowsing queryForThreatListUpdatesFetchWithObject:]

/**
 *  Fetches a @c GTLRSafeBrowsing_FetchThreatListUpdatesResponse.
 *
 *  Fetches the most recent threat list updates. A client can request updates
 *  for multiple lists at once.
 *
 *  @param object The @c GTLRSafeBrowsing_FetchThreatListUpdatesRequest to
 *    include in the query.
 *
 *  @returns GTLRSafeBrowsingQuery_ThreatListUpdatesFetch
 */
+ (instancetype)queryWithObject:(GTLRSafeBrowsing_FetchThreatListUpdatesRequest *)object;

@end

/**
 *  Finds the threat entries that match the Safe Browsing lists.
 *
 *  Method: safebrowsing.threatMatches.find
 */
@interface GTLRSafeBrowsingQuery_ThreatMatchesFind : GTLRSafeBrowsingQuery
// Previous library name was
//   +[GTLQuerySafeBrowsing queryForThreatMatchesFindWithObject:]

/**
 *  Fetches a @c GTLRSafeBrowsing_FindThreatMatchesResponse.
 *
 *  Finds the threat entries that match the Safe Browsing lists.
 *
 *  @param object The @c GTLRSafeBrowsing_FindThreatMatchesRequest to include in
 *    the query.
 *
 *  @returns GTLRSafeBrowsingQuery_ThreatMatchesFind
 */
+ (instancetype)queryWithObject:(GTLRSafeBrowsing_FindThreatMatchesRequest *)object;

@end

NS_ASSUME_NONNULL_END
