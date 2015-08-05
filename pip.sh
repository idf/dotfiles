sudo -v;
sudo pip install requests[security];  # SSL connection 
sudo pip install howdoi;
sudo pip install cheat;

# Fix PIL, or comment out PIL inside requirements.txt, or use pillow instead
sudo pip install PIL --allow-external PIL --allow-unverified PIL;
