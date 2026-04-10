# DocCheck Service - Swagger/OpenAPI Documentation

## Overview

The DocCheck microservice includes comprehensive Swagger documentation for all document verification endpoints.

## Accessing the Documentation

### Swagger UI (Interactive)
- **Local Development**: http://localhost:8001/api/docs/
- **Production**: https://doccheckservice-copy-production.up.railway.app/api/docs/

Interactive interface where you can:
- Browse all document verification endpoints
- See request/response schemas
- Try out API calls directly
- Test document processing workflows
- Check error responses

### ReDoc (Alternative Documentation)
- **Local Development**: http://localhost:8001/api/redoc/
- **Production**: https://doccheckservice-copy-production.up.railway.app/api/redoc/

### OpenAPI Schema (JSON)
- **Local Development**: http://localhost:8001/api/schema/
- **Production**: https://doccheckservice-copy-production.up.railway.app/api/schema/

## Main Endpoints

### Document Cases
- `GET /api/cases/` - List all verification cases
- `POST /api/cases/` - Create a new verification case
- `GET /api/cases/{id}/` - Get case details
- `PUT /api/cases/{id}/` - Update a case
- `DELETE /api/cases/{id}/` - Delete a case

### Case Status Updates
- `POST /api/cases/{id}/status/` - Update case status
- `GET /api/cases/{id}/status/` - Get case status

### Document Extraction
- `POST /api/cases/{id}/extract/` - Extract information from documents
- `GET /api/cases/{id}/extraction_results/` - Get extraction results

### Document Type Detection
- `POST /api/cases/{id}/detect_type/` - Auto-detect document type
- `GET /api/cases/{id}/detected_types/` - Get detected document types

### Document Verification
- `POST /api/cases/{id}/verify/` - Verify document authenticity
- `GET /api/cases/{id}/verification_status/` - Get verification status

## Authentication

The DocCheck service uses JWT Bearer token authentication:

1. Go to `/api/docs/`
2. Click the **"Authorize"** button
3. Select **"Bearer"** authentication
4. Paste your JWT token: `Bearer <your_token>`

## Testing Workflows

### Example: Create and Process a Case

1. **POST /api/cases/** - Create new case
   ```json
   {
     "provider_case_id": "CASE-001",
     "document_type": "ID",
     "status": "pending"
   }
   ```

2. **POST /api/cases/{id}/extract/** - Extract document info
   ```json
   {
     "document_file": "<base64_or_url>"
   }
   ```

3. **POST /api/cases/{id}/detect_type/** - Detect document type
   ```json
   {
     "document_file": "<base64_or_url>"
   }
   ```

4. **POST /api/cases/{id}/verify/** - Verify document
   ```json
   {
     "verification_type": "authenticity"
   }
   ```

## Features

- ✅ Full OpenAPI 3.0 support
- ✅ JWT Bearer authentication
- ✅ Document type auto-detection
- ✅ Information extraction from documents
- ✅ Document authenticity verification
- ✅ Case status tracking
- ✅ Error handling and validation
- ✅ Request/response examples

## Error Responses

Common error codes:

- `400 Bad Request` - Invalid input or validation error
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Permission denied
- `404 Not Found` - Resource not found
- `500 Internal Server Error` - Server error

## Exporting OpenAPI Schema

To export the OpenAPI schema for external tools:

```bash
python manage.py spectacular --file doccheck_schema.json
```

Can be imported into:
- Postman
- Insomnia
- Swagger Editor
- Code generators
