import Swaggerjsdoc from 'swagger-jsdoc';
export const swaggerSpec = Swaggerjsdoc({
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'My API',
            version: '1.0.0',
        },
    },
    servers: [
        {
            url: 'http://localhost:3000',
        },
    ],
    components: {
        securitySchemes: {
            bearerAuth: {
    apis: ['./controllers/*.ts'], 
            },
        },
    },
    security:[{
        bearerAuth: [],
    }]

    // Path to the API docs
});

export const swaggerUiAPI={
    url: '/api-docs.json',
    swaggerOptions: {
    
        docExpansion: 'none',
    },
}
