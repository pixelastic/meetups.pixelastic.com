
Fabriq
Mix of Trello for tickets
Calendar

Productivitty SaaS for factor

Stack
Vuejs, Cloudflare, aws django an algolia
Cloudflare is a firewall
AWS used fr pytho django for MVC backend
SQL database
Algolia for search
Upload file in S3
Business as usual

Issue:
AWS is expensive
DX is hard. 
Django good for a MVP, harder for a SaaS and performance. Harder to use well
Slow down developer experience, slow down recruitment

Ideal stack should be fast, everywhere
Users are in France, but users are everuwjere
23 countries, 5 continents
UNcommon for such an easy stack to be that spread

They want something cheap
and not much ops. Ops is great, they can do it, but ops is expensive

serverless means we don't handle the server abstraction. we don't care about
monitoring or scaling, we pay for it to be handled

Serverless:
perfo yep but cold start
everywhee yep but you need to distribute
cheap: pas as you go
security ok
not much ops? hey lambda starts to get complex
DX... some are better than others

regionless is above serverless
serverless handles servers
regionless handles geiography

Cloudflare workers to use instead o ddjango
Uses Isolat v8, which has no cold start, a bit like opening a new tab instead of
opening chrome
pretty cheap. Well cloudflare is expensive, but just the workers isnnt'

Legacy 110ms in FR, 600ms in California
Legacy from pars, 110ms, 120ms in california
5x faster

Is the DX good?
Upload and deploy
Issue is that not node, specific version, no community, 

Distribute data is important
can't shard by continent, becaue customers want to share data between their
sites

Fauna is good for that
Serverless database, document, nosql
database in databases, hierarchies
Can create regions between DB, so create for customers in several countries
regions are not based only on geography, can define arbitrary zones

Legacy FR 150ms, California 700ms
Fauna 140ms and 350ms
Better, but not the same

DX is that they have their own language SQL
Not much tooling, but very good

DX Algolia
SDK top, great docs, frontend components
no local dev

They are migrating progrssively for all customers


## AWS Game Dev


