const GraphQLClient = require('graphql-request').GraphQLClient;
const sortNumbers = require('sort-numbers');

describe('Stats Tests', function() {
    const self = this;
    beforeAll(() => {
        const endpoint = 'http://localhost:4000/graphiql';
        self.client = new GraphQLClient(endpoint, { headers: {} });
    });

    it('StatsTotal - without date definitions', done => {
        const query = `{
            statsTotal {
                visitsCount
                usersCount
                websitesCount
                visits {
                    timestamp
                    user {
                        id
                        name
                        email
                        dateOfBirth
                        gender
                    }
                }
                users {
                    id
                    name
                    email
                    dateOfBirth
                    gender
                }
                websites {
                    url
                    topic
                }
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(res.statsTotal).toBeDefined();
                expect(res.statsTotal.visitsCount).toBeDefined();
                expect(res.statsTotal.usersCount).toBeDefined();
                expect(res.statsTotal.websitesCount).toBeDefined();
                expect(res.statsTotal.users).toBeDefined();
                expect(res.statsTotal.websites).toBeDefined();
                done();
            })
    });
});