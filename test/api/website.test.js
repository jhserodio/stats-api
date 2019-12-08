const GraphQLClient = require('graphql-request').GraphQLClient;
const sortNumbers = require('sort-numbers');

describe('Website Tests', function() {
    const self = this;
    beforeAll(() => {
        const endpoint = 'http://localhost:4000/graphiql';
        self.client = new GraphQLClient(endpoint, { headers: {} });
    });

    it('check if website with id: 1 exist', done => {
        const query = `{
            website(id: 1) {
                url
                topic
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(res.website).toBeDefined();
                expect(res.website.url).toBeDefined();
                expect(res.website.topic).toBeDefined();
                done();
            })
    });

    it('check if website with id: 9999 dont exist', done => {
        const query = `{
            website(id: 999) {
                url
                topic
            }
        }`;

        self.client.request(query)
            .catch(err => {
                expect(err).toBeDefined();
                done();
            })
    });

    it('check if website with url: https://www.rust-lang.org/ exist', done => {
        const query = `{
            websiteByUrl(url: "https://www.rust-lang.org/") {
                url
                topic
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(res.websiteByUrl).toBeDefined();
                expect(res.websiteByUrl.url).toBeDefined();
                expect(res.websiteByUrl.topic).toBeDefined();
                done();
            })
    });

    it('check if website with url unformatted', done => {
        const query = `{
            websiteByUrl(url: "1234") {
                url
                topic
            }
        }`;

        self.client.request(query)
            .catch(err => {
                expect(err).toBeDefined();
                done();
            })
    });

    it('check if website with url: https://www.no.no/ dont exist', done => {
        const query = `{
            websiteByUrl(url: "https://www.no.no/") {
                url
                topic
            }
        }`;

        self.client.request(query)
            .catch(err => {
                expect(err).toBeDefined();
                done();
            })
    });

    it('check default config to query websites', done => {
        const query = `{
            websites {
                topic
                url
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(res.websites.length).toBe(10);
                done();
            })
    });

    it('check query websites with limit 11', done => {
        const query = `{
            websites(limit: 11) {
                url
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(res.websites.length).toBe(11);
                done();
            })
    });

    it('check query websites with skip', done => {
        const query = `{
            websites(skip: 1) {
                id
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(Number(res.websites[0].id)).toBe(2);
                done();
            })
    });

    it('check query websites with sort_order', done => {
        const query = `{
            websites(sort_order: ASC) {
                id
            }
        }`;

        const queryDesc = `{
            websites(sort_order: DESC) {
                id
            }
        }`;

        self.client.request(query)
            .then(res => {
                const result = res.websites.map(website => Number(website.id));
                const ordenedWithSort = sortNumbers(result)

                expect(
                    result
                ).toEqual(ordenedWithSort);
            })

        self.client.request(queryDesc)
            .then(res => {
                const result = res.websites.map(website => Number(website.id));
                const ordenedWithSort = sortNumbers(result).reverse()

                expect(
                    res.websites.map(website => Number(website.id))
                ).toEqual(ordenedWithSort);
                done();
            })
    });

    it('check query websites with sort_field', done => {
        const queryUrl = `{
            websites(sort_field: URL) {
                id
            }
        }`;

        const queryTopic = `{
            websites(sort_field: TOPIC) {
                id
            }
        }`;

        self.client.request(queryUrl)
            .then(res => {
                const result = res.websites.map(website => Number(website.id));
                const ordenedWithSort = result.sort()

                expect(
                    result
                ).toEqual(ordenedWithSort);
            })

        self.client.request(queryTopic)
            .then(res => {
                const result = res.websites.map(website => Number(website.id));
                const ordenedWithSort = result.sort()

                expect(
                    result
                ).toEqual(ordenedWithSort);
                done();
            })
    });

    it('upsert websites - new website', done => {

        const mock = {
            url: "https://www.vim.org/",
            topic: "editor",
        }

        const query = `mutation {
            upsertWebsite(
                url: "${mock.url}",
                topic: "${mock.topic}",
            ) {
                url
                topic
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(res.upsertWebsite).toEqual(mock);
                expect(res.upsertWebsite.url).toBe(mock.url);
                expect(res.upsertWebsite.topic).toBe(mock.topic);
                done();
            })
    });


    it('upsert websites - update website', done => {

        const mock = {
            url: "https://www.vim.org/",
            topic: "editor",
        }

        const mockUpdate = {
            topic: "besteditor",
        }

        const query = `mutation {
            upsertWebsite(
                url: "${mock.url}",
                topic: "${mock.topic}",
            ) {
                url
                topic
            }
        }`;

        const queryUpdate = `mutation {
            upsertWebsite(
                url: "${mock.url}",
                topic: "${mockUpdate.topic}",
            ) {
                url
                topic
            }
        }`;

        client = self.client.request(query)
            .then(res => {
                res.upsertWebsite
            });

        self.client.request(queryUpdate)
            .then(res => {
                expect(res.upsertWebsite).toEqual({
                    ...mock,
                    ...mockUpdate
                });
                done();
            })
    });
});