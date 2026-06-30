#!/usr/bin/env python3
"""HTTP server with CORS support for local 3D model viewing."""

import http.server
import socketserver
import os

PORT = 8088
DIRECTORY = os.path.dirname(os.path.abspath(__file__))

class CORSHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)

    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', '*')
        super().end_headers()

    def guess_type(self, path):
        # Force correct MIME types
        if path.endswith('.glb'):
            return 'model/gltf-binary'
        if path.endswith('.gltf'):
            return 'model/gltf+json'
        if path.endswith('.gz'):
            if path.endswith('.glb.gz'):
                return 'model/gltf-binary'
            return 'application/gzip'
        return super().guess_type(path)

    def log_message(self, format, *args):
        # Quieter logging
        print(f"[{self.address_string()}] {args[0]}")

if __name__ == '__main__':
    with socketserver.TCPServer(("", PORT), CORSHTTPRequestHandler) as httpd:
        print(f"=" * 50)
        print(f"  Server running at: http://localhost:{PORT}")
        print(f"  Serving directory: {DIRECTORY}")
        print(f"  CORS enabled: Yes")
        print(f"=" * 50)
        print("  Press Ctrl+C to stop")
        print()
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\nServer stopped.")
