import { PrismaClient } from '@prisma/client';
import * as argon from 'argon2';

const prisma = new PrismaClient();

async function main() {
  const hashedPassword = await argon.hash('123');
  const adminUser = await prisma.admin.upsert({
    where: { email: 'admin@example.com' },
    update: {
      phone: '0987654321',
      password: hashedPassword,
    },
    create: {
      fullName: 'Betsegaw Mesele',
      email: 'admin@example.com',
      password: hashedPassword,
      role: 'admin',
      phone: '0987654321',
    },
  });
  console.log({ adminUser });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
