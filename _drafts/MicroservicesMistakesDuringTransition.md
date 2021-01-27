# Microservices mistakes during transition

Summary notes of [DevTernity 2019 Jakub Nabrdalik – Common Mistakes When Moving to Microservices](https://www.youtube.com/watch?v=sXIvrgTtmZE)
[Introduction](#Introduction)



## Introduction
EA - enterprise organization rather than software 


Architecture must be distributed to agile teams and use Architecture guild
to ensure consistency in the design 
after 3-6 months CTO decides its not benefiting so kills its
due to: 
	private comm channels (not transparent)
	no outcomes 
	no practices
	no resposibilities
	nothing published

## Be Responsible:
create git repo for achitecture give access to everyone
decide what the guild does and write it down (readme.md)
knowledge sharing (diagrams, articles,(
common practices
technical research and recommendations
proactive changes to architecture (before dev slows down)
solving urgent issues - issue that goes beyond single teams

## Responsive:
speaker of guild - on duty rotating role
ensure people get answers, decisions are made
calls for working gorups when urgent issues arise
accountable for process and outcomes
the nice human interface fo the guild

## Inclusive
invite everyone who is interested in architecture
accept all by default (read/pull request)

## Efficient
meets at least every sprint, runs through action points and non urgent issues
if there is urgent issue, guild meets right away
for a problem/decision create workgroup (2-4 ppl, not the entire guild, those who are interested)
workgroup does resarch publishes RFC in git repo (request for comment to all IT, business)
everyone can comment, give people at least 1 week to process
when consensus is achieved publish recommendation ADR achitectural decsion record

look at failure domain along with happy path

## Transparent
open comm channels
publish each sprint a newsletter, 
what the guild did
what the guild is working on
new RFC's to comment
new ADR's written
who is the speaker of the guild this sprint
how you can contact the guild

Providing Guidance
- provide the understanding
- not everyone is on same level

simon brown software architecture for developers

## What are drivers architecture
Quality attributes
  Maintainability - time supporting what we have built
  Extensibility
  Performance - how many requests/sec
  Scalability
  Availability
  Security
  Flexibility

Constraints
  People - labor intensive
  Time and Budget
  Technology
  Organizational

Architecture Diagram is a map
[c4model](https://c4model.com)

Validation
follow the flow and use cases
[Web Sequence Diagrams](websequencediagrams.com)

## Cross cutting product teams - windows vista
1 team multiple repos
Organizational Structure on software quality - 
understand the systems - 
expensive multiple teams
cheap things 1 team
Conways law
- greate number of engineers touching the code higher the failure rate
- more edits to a companent - higher instability/failure rate
- ownership by a master/single person with 75% or more edits had failure rates

## Team Setup
- Each codebase is changed by only 1 team - belongs to them they have full control
- ecah team can have several codebases
- cross cutting concerns - db, events,ux, monitoring require a seperate guild or team
- teams should have to communicate as little as possible
- teams should have to coordinate as little as possible
- PO's should communicate as much as possible

Org Struture vs Architecture
- Design org structure give eah department power to design their architecture
- communication between teams via event bus removving temporal coupling
- introduce consumer driven contracts

Command & Control vs Empowerment & Trust
- big deployment - deployment manager/control 

Microservice - no big deployments
- individually deployable
- no synchronisation
- samll deployments remove big deployment risks
- learn how to make your achitecture resillent and event based
- use rolling deployments/canary/a-b testing, automatic rollbacks
- learn to monitor well







additional links:
[Comcasts Architecture Guild](https://www.infoq.com/articles/architecture-guild-800-friends/)
[Architecture Decision Records](https://github.com/joelparkerhenderson/architecture_decision_record)