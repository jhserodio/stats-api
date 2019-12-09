const GraphQLClient = require('graphql-request').GraphQLClient;

describe('Visit Tests', function() {
    const self = this;
    beforeAll(() => {
        const endpoint = 'http://localhost:4000/graphiql';
        self.client = new GraphQLClient(endpoint, { headers: {} });
    });

    it('new visit', done => {

        const mock = {
            website: 2,
            user: 2,
            timestamp: "2010-04-17T14:00:00Z"
        }

        const query = `mutation {
            newVisit(
                user: ${mock.website},
                website: ${mock.user},
                timestamp: "${mock.timestamp}"
              ) {
                timestamp
                user {
                  id
                }
                website {
                  id
                }
              }
        }`;

        self.client.request(query)
            .then(res => {
                expect(res.newVisit).toBeDefined();
                expect(Number(res.newVisit.website.id)).toBe(mock.website);
                expect(Number(res.newVisit.user.id)).toBe(mock.user);
                done();
            })
    });

    it('new visit - website dont exist', done => {

        const mock = {
            website: 999,
            user: 2,
            timestamp: "2010-04-17T14:00:00Z"
        }

        const query = `mutation {
            newVisit(
                user: ${mock.website},
                website: ${mock.user},
                timestamp: "${mock.timestamp}"
              ) {
                timestamp
                user {
                  id
                }
                website {
                  id
                }
              }
        }`;

        self.client.request(query)
            .catch(res => {
                expect(res).toBeDefined();
                done();
            })
    });

    it('new visit - website dont exist', done => {

        const mock = {
            website: 2,
            user: 999,
            timestamp: "2010-04-17T14:00:00Z"
        }

        const query = `mutation {
            newVisit(
                user: ${mock.website},
                website: ${mock.user},
                timestamp: "${mock.timestamp}"
              ) {
                timestamp
                user {
                  id
                }
                website {
                  id
                }
              }
        }`;

        self.client.request(query)
            .catch(res => {
                expect(res).toBeDefined();
                done();
            })
    });

    it('new visit - without timestamp', done => {

        const mock = {
            website: 2,
            user: 999,
        }

        const query = `mutation {
            newVisit(
                user: ${mock.website},
                website: ${mock.user},
              ) {
                timestamp
                user {
                  id
                }
                website {
                  id
                }
              }
        }`;

        self.client.request(query)
            .catch(res => {
                expect(res).toBeDefined();
                done();
            })
    });
});