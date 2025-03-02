FROM node:lts-buster

# تثبيت الحزم المطلوبة
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# نسخ package.json وتثبيت الحزم
COPY package.json .

RUN npm install

# نسخ باقي الملفات (التي تحتوي على index.js)
COPY . .

# فتح البورت المطلوب
EXPOSE 5000

# بدء التطبيق باستخدام npm start
CMD ["npm", "start"]