# Personal Finance Tracker - Finance CI Integration

A backend API for a personal finance tracker with comprehensive integration tests and GitHub Actions CI/CD pipeline.

## Project Structure

```
finance-ci-integration/
├── .github/
│   └── workflows/
│       └── ci.yml          # GitHub Actions CI workflow
├── backend/
│   ├── tests/
│   │   └── integration.test.js  # Jest integration tests
│   ├── app.js              # Express app with all APIs
│   ├── server.js           # Server entry point
│   └── package.json        # Dependencies and scripts
├── .gitignore
└── README.md
```

## Features

✅ **5 Main APIs**
- `GET /api/dashboard` - Get financial summary (income, expenses, balance)
- `GET /api/expenses` - Retrieve all expenses
- `POST /api/expenses` - Add new expense
- `GET /api/income` - Retrieve all income sources
- `POST /api/income` - Add new income source

✅ **9 Integration Tests (All Passing)**
- Dashboard summary accuracy
- Expense management (CRUD operations)
- Income management (CRUD operations)
- Error handling validation
- Real-time dashboard updates

✅ **GitHub Actions CI Pipeline**
- Automated testing on every push and pull request
- Runs on Ubuntu latest
- Node.js 18 with npm caching
- Complete test suite execution

## Prerequisites

- Node.js 18 or higher
- npm or yarn
- Git
- GitHub account

## Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/finance-ci-integration.git
cd finance-ci-integration
```

### 2. Install Backend Dependencies

```bash
cd backend
npm install
```

### 3. Run Tests Locally

```bash
npm test
```

**Expected Output:** All 9 tests should PASS ✅

### 4. Start the Backend Server

```bash
npm start
```

The server will run on `http://localhost:5000`

## API Endpoints

### Dashboard Summary
```bash
GET /api/dashboard
```
Response:
```json
{
  "totalIncome": 12000,
  "totalExpenses": 800,
  "balance": 11200
}
```

### Expenses
```bash
GET /api/expenses
POST /api/expenses
Body: { "title": "Rent", "amount": 1000 }
```

### Income
```bash
GET /api/income
POST /api/income
Body: { "source": "Salary", "amount": 10000 }
```

## GitHub Actions CI Setup

1. **Push this code to GitHub**
   ```bash
   git branch -M main
   git remote add origin https://github.com/<your-username>/finance-ci-integration.git
   git push -u origin main
   ```

2. **View CI Runs**
   - Go to your GitHub repository
   - Click **Actions** tab
   - Watch the CI workflow execute
   - All tests will run automatically

## Test Results

```
PASS  tests/integration.test.js (2.621s)
✓ Dashboard API returns correct summary data
✓ Get all expenses returns correct data
✓ Add new expense successfully
✓ Add expense without required fields returns error
✓ Get all income returns correct data
✓ Add new income successfully
✓ Add income without required fields returns error
✓ Dashboard reflects new expense
✓ Dashboard reflects new income

Tests: 9 passed, 9 total
```

## How to Set Up Git and Push to GitHub

Since Git is not installed on the current system, follow these steps:

### Option 1: Use Git from VS Code Terminal
1. Install Git from https://git-scm.com/download/win
2. Restart VS Code
3. Open VS Code Terminal and run:
   ```bash
   cd d:\Devops2026\20260216\finance-ci-integration
   git init
   git add .
   git commit -m "Add backend APIs + integration tests + CI workflow"
   git branch -M main
   git remote add origin https://github.com/<YOUR-USERNAME>/<YOUR-REPO-NAME>.git
   git push -u origin main
   ```

### Option 2: Use GitHub Desktop
1. Download GitHub Desktop from https://desktop.github.com/
2. Create a new repository locally pointing to this folder
3. Commit and push to GitHub

## Environment Variables

You can set the following environment variables:

```bash
PORT=5000          # Server port (default: 5000)
NODE_ENV=test      # Environment mode
```

## Files Included

- **backend/app.js** - Express application with all API routes
- **backend/server.js** - Server entry point
- **backend/tests/integration.test.js** - Jest test suite with 9 comprehensive tests
- **backend/package.json** - Dependencies and npm scripts
- **.github/workflows/ci.yml** - GitHub Actions workflow for automated testing
- **.gitignore** - Git ignore rules

## Next Steps

1. ✅ Create project folder and backend structure
2. ✅ Install all dependencies (Express, CORS, Jest, Supertest)
3. ✅ Create backend APIs (5 endpoints)
4. ✅ Create comprehensive integration tests (9 tests)
5. ✅ Run tests locally - **ALL PASSING** ✨
6. ✅ Set up GitHub Actions CI workflow
7. ⏳ **TODO:** Install Git and push to GitHub
8. ⏳ **TODO:** View CI runs in GitHub Actions

## Troubleshooting

### Tests failing?
- Make sure all dependencies are installed: `npm install`
- Check that server.js is in the backend folder
- Ensure the in-memory data is reset between tests

### CI not running?
- Verify `.github/workflows/ci.yml` exists in the repository
- Check that you pushed to the correct branch (`main`)
- Go to GitHub repository → Actions tab to see logs

## License

MIT

---

**Status:** ✅ Local development environment complete with all tests passing!
**Next:** Set up Git and push to GitHub to see CI in action.
