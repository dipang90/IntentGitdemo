//
//  RepositoryResponse.swift
//  IntentGitdemo
//
//  Created by Dipang Sheth on 8/14/21.
//

import Foundation

/*
 RepositoryResponse API - JSON - response model class. API response has been converted to model class
  */

struct RepositoryResponse: Decodable {
    var totalCount: Int?
    var incompleteResults: Bool?
    var items: [RepositoryItem]?


    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items = "items"
    }
}

// MARK: - Item
struct RepositoryItem: Decodable {
    var id: Int?
    var nodeid: String?
    var name: String?
    var fullName: String?
    var itemPrivate: Bool?
    var owner: RepositoryItemOwner?
    var htmlurl: String?
    var itemDescription: String?
    var fork: Bool?
    var url: String?
    var forksurl: String?
    var keysurl: String?
    var collaboratorsurl: String?
    var teamsurl: String?
    var hooksurl: String?
    var issueEventsurl: String?
    var eventsurl: String?
    var assigneesurl: String?
    var branchesurl: String?
    var tagsurl: String?
    var blobsurl: String?
    var gitTagsurl: String?
    var gitRefsurl: String?
    var treesurl: String?
    var statusesurl: String?
    var languagesurl: String?
    var stargazersurl: String?
    var contributorsurl: String?
    var subscribersurl: String?
    var subscriptionurl: String?
    var commitsurl: String?
    var gitCommitsurl: String?
    var commentsurl: String?
    var issueCommenturl: String?
    var contentsurl: String?
    var compareurl: String?
    var mergesurl: String?
    var archiveurl: String?
    var downloadsurl: String?
    var issuesurl: String?
    var pullsurl: String?
    var milestonesurl: String?
    var notificationsurl: String?
    var labelsurl: String?
    var releasesurl: String?
    var deploymentsurl: String?
    var createdAt: String?
    var updatedAt: String?
    var pushedAt: String?
    var giturl: String?
    var sshurl: String?
    var cloneurl: String?
    var svnurl: String?
    var homepage: String?
    var size: Int?
    var stargazersCount: Int?
    var watchersCount: Int?
    var language: String?
    var hasIssues: Bool?
    var hasProjects: Bool?
    var hasDownloads: Bool?
    var hasWiki: Bool?
    var hasPages: Bool?
    var forksCount: Int?
    var mirrorurl: String?
    var archived: Bool?
    var disabled: Bool?
    var openIssuesCount: Int?
    var license: RepositoryItemLicense?
    var forks: Int?
    var openIssues: Int?
    var watchers: Int?
    var defaultBranch: String?
    var score: Int?
    
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeid = "node_id"
        case name = "name"
        case fullName = "full_name"
        case itemPrivate = "private"
        case owner = "owner"
        case htmlurl = "html_url"
        case itemDescription = "description"
        case fork = "fork"
        case url = "url"
        case forksurl = "forks_url"
        case keysurl = "keys_url"
        case collaboratorsurl = "collaborators_url"
        case teamsurl = "teams_url"
        case hooksurl = "hooks_url"
        case issueEventsurl = "issue_events_url"
        case eventsurl = "events_url"
        case assigneesurl = "assignees_url"
        case branchesurl = "branches_url"
        case tagsurl = "tags_url"
        case blobsurl = "blobs_url"
        case gitTagsurl = "git_tags_url"
        case gitRefsurl = "git_refs_url"
        case treesurl = "trees_url"
        case statusesurl = "statuses_url"
        case languagesurl = "languages_url"
        case stargazersurl = "stargazers_url"
        case contributorsurl = "contributors_url"
        case subscribersurl = "subscribers_url"
        case subscriptionurl = "subscription_url"
        case commitsurl = "commits_url"
        case gitCommitsurl = "git_commits_url"
        case commentsurl = "comments_url"
        case issueCommenturl = "issue_comment_url"
        case contentsurl = "contents_url"
        case compareurl = "compare_url"
        case mergesurl = "merges_url"
        case archiveurl = "archive_url"
        case downloadsurl = "downloads_url"
        case issuesurl = "issues_url"
        case pullsurl = "pulls_url"
        case milestonesurl = "milestones_url"
        case notificationsurl = "notifications_url"
        case labelsurl = "labels_url"
        case releasesurl = "releases_url"
        case deploymentsurl = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case giturl = "git_url"
        case sshurl = "ssh_url"
        case cloneurl = "clone_url"
        case svnurl = "svn_url"
        case homepage = "homepage"
        case size = "size"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language = "language"
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case forksCount = "forks_count"
        case mirrorurl = "mirror_url"
        case archived = "archived"
        case disabled = "disabled"
        case openIssuesCount = "open_issues_count"
        case license = "license"
        case forks = "forks"
        case openIssues = "open_issues"
        case watchers = "watchers"
        case defaultBranch = "default_branch"
        case score = "score"
    }
}


// MARK: - License
struct RepositoryItemLicense: Decodable {
    var key: String?
    var name: String?
    var spdxid: String?
    var url: String?
    var nodeid: String?

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case spdxid = "spdx_id"
        case url = "url"
        case nodeid = "node_id"
    }
}

// MARK: - Owner
struct RepositoryItemOwner: Decodable {
    var login: String?
    var id: Int?
    var nodeid: String?
    var avatarurl: String?
    var gravatarid: String?
    var url: String?
    var htmlurl: String?
    var followersurl: String?
    var followingurl: String?
    var gistsurl: String?
    var starredurl: String?
    var subscriptionsurl: String?
    var organizationsurl: String?
    var reposurl: String?
    var eventsurl: String?
    var receivedEventsurl: String?
    var type: String?
    var siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case nodeid = "node_id"
        case avatarurl = "avatar_url"
        case gravatarid = "gravatar_id"
        case url = "url"
        case htmlurl = "html_url"
        case followersurl = "followers_url"
        case followingurl = "following_url"
        case gistsurl = "gists_url"
        case starredurl = "starred_url"
        case subscriptionsurl = "subscriptions_url"
        case organizationsurl = "organizations_url"
        case reposurl = "repos_url"
        case eventsurl = "events_url"
        case receivedEventsurl = "received_events_url"
        case type = "type"
        case siteAdmin = "site_admin"
    }
}

