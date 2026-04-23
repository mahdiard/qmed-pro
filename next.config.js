/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  srcDir: './src',
  images: {
    remotePatterns: [{ protocol: 'https', hostname: '**' }],
  },
  experimental: {
    serverActions: { allowedOrigins: ['localhost:3000', 'capacitor://localhost', 'ionic://localhost'] },
  },
};

// Only enable static export and disable image optimization when building for mobile
if (process.env.NEXT_OUTPUT_MODE === 'export') {
  nextConfig.output = 'export';
  nextConfig.images.unoptimized = true;
}

module.exports = nextConfig;
