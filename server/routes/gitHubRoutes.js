const router = require("express").Router();
const axios = require('axios');

router.route("/user").get( async (req, res) => {
    try {
        const response = await axios.get('https://api.github.com/user', {
          headers: {
            'Accept': 'application/vnd.github+json',
            'Authorization': `Bearer ${process.env.GITHUB_TOKEN}`,  // Replace with your token or use an environment variable
            'X-GitHub-Api-Version': '2022-11-28'
          }
        });
    
        res.json(response.data);
        console.log(JSON.stringify(response.data))
      } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error fetching data from GitHub' });
      }
});

router.route("/repos").get( async (req, res) => {
    try {
        const response = await axios.get('https://api.github.com/users/Pierre81385/repos', {
          headers: {
            'Accept': 'application/vnd.github+json',
            'Authorization': `Bearer ${process.env.GITHUB_TOKEN}`,  // Replace with your token or use an environment variable
            'X-GitHub-Api-Version': '2022-11-28'
          }
        });
    
        res.json(response.data);
        console.log(JSON.stringify(response.data))
      } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error fetching data from GitHub' });
      }
});



module.exports = router;