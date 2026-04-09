import type { Metadata } from "next";
import SiteLogo from "../components/SiteLogo";

export const metadata: Metadata = {
  title: "Contact | KAYO",
  description: "Contact KAYO support.",
};

export default function ContactPage() {
  return (
    <main className="legal-page contact-page">
      <article className="legal-shell">
        <SiteLogo className="legal-logo" />
        <h1>Contact</h1>
        <p>
          For support, partnerships, or legal/privacy questions, email us at:
        </p>
        <p className="contact-email">
          <a href="mailto:kayo@keeganryan.co">kayo@keeganryan.co</a>
        </p>
      </article>
    </main>
  );
}
