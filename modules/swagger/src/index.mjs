import { APIGateway } from '@aws-sdk/client-api-gateway'

export const handler = async (event) => {
  console.log(JSON.stringify(event, null, 2))
  const apiGateway = new APIGateway()

  // export the API in swagger format
  const params = {
    exportType: 'swagger',
    restApiId: event.requestContext.apiId,
    stageName: event.requestContext.stage,
    accepts: 'application/json',
  }
  const result = await apiGateway.getExport(params)

  // decode the body from Uint8Array to string
  const body = Buffer.from(result.body).toString()

  return {
    statusCode: 200,
    headers: {
      'Content-Type': 'application/json',
    },
    body,
  }
}