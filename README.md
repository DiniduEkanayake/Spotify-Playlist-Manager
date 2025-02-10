# Spotify Playlist Manager with Terraform

## Introduction
Terraform is widely used for managing infrastructure on cloud platforms like AWS, Azure, and GCP. However, it can also interact with third-party services like Spotify. This project demonstrates how to use Terraform to create a Spotify playlist by searching for songs, albums, or artists.

## Prerequisites
To follow this tutorial, you need:
- Terraform (version 1.0+)
- Docker Desktop
- A Spotify account with developer access

## Setting Up the Spotify Developer App
1. Log into the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard).
2. Create an application named **Terraform Playlist Demo**.
3. Set the Redirect URI to `http://localhost:27228/spotify_callback` and save the settings.

## Running the Authorization Server
1. Set the Redirect URI as an environment variable:
   ```sh
   export SPOTIFY_CLIENT_REDIRECT_URI=http://localhost:27228/spotify_callback
   ```
2. Create a `.env` file and store the Spotify **Client ID** and **Client Secret**:
   ```sh
   SPOTIFY_CLIENT_ID=your-client-id
   SPOTIFY_CLIENT_SECRET=your-client-secret
   ```
3. Run the authorization server using Docker:
   ```sh
   docker run --rm -it -p 27228:27228 --env-file ./.env ghcr.io/conradludgate/spotify-auth-proxy
   ```
4. Authenticate using the provided URL in the terminal output.

## Cloning and Configuring Terraform
1. Clone the example repository:
   ```sh
   git clone https://github.com/DiniduEkanayake/Spotify-Playlist-Manager.git
   cd Spotify-Playlist-Manager
   ```
2. Open `main.tf` to explore Terraform configurations.
3. Set up the Spotify provider and API key.
4. Rename the configuration file:
   ```sh
   mv terraform.tfvars.example terraform.tfvars
   ```
5. Insert the API key from the authorization server into `terraform.tfvars`:
   ```sh
   spotify_api_key = "your-api-key"
   ```

## Initializing and Running Terraform
1. Install the Spotify provider:
   ```sh
   terraform init
   ```
2. Apply the Terraform configuration to create a playlist:
   ```sh
   terraform apply
   ```
3. Confirm with **yes** when prompted.

## Accessing and Customizing the Playlist
- The playlist URL will be displayed in Terraform’s output.
- Modify the playlist by changing the artist, adding specific albums, or manually selecting song IDs in `main.tf`.

## Conclusion
This project demonstrates how to automate playlist creation on Spotify using Terraform. You can further explore Terraform’s capabilities by customizing your playlists and sharing them on social media.

## Resources
- [Terraform Documentation](https://www.terraform.io/docs)
- [Spotify Developer](https://developer.spotify.com/documentation)
