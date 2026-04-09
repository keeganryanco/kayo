import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Terms & Conditions | KAYO",
  description: "Terms governing use of the KAYO app and website.",
};

export default function TermsPage() {
  return (
    <main className="legal-page">
      <article className="legal-shell">
        <p className="legal-kicker">KAYO</p>
        <h1>Terms &amp; Conditions</h1>
        <p className="legal-meta">Effective date: April 9, 2026</p>

        <section>
          <h2>Acceptance of Terms</h2>
          <p>
            By downloading, accessing, or using KAYO, you agree to these Terms
            &amp; Conditions and our Privacy Policy. If you do not agree, do not
            use the app or website.
          </p>
        </section>

        <section>
          <h2>Service Description</h2>
          <p>
            KAYO provides digital tools to help users reduce screen time,
            improve focus, and build healthier usage habits. Features may change
            over time as we improve the service.
          </p>
        </section>

        <section>
          <h2>Eligibility and Account Responsibility</h2>
          <p>
            You must have legal capacity to agree to these terms. You are
            responsible for maintaining control of your device, Apple ID, and
            any credentials used with KAYO.
          </p>
        </section>

        <section>
          <h2>Subscriptions and Billing</h2>
          <ul>
            <li>
              Paid subscriptions are processed by Apple through your App Store
              account.
            </li>
            <li>
              Pricing, trials, and renewal terms are presented in the app before
              purchase.
            </li>
            <li>
              Subscriptions automatically renew unless canceled at least 24
              hours before the end of the current period.
            </li>
            <li>
              Manage and cancel subscriptions in your Apple ID subscription
              settings.
            </li>
            <li>
              Refund requests are handled by Apple according to Apple&apos;s
              policies.
            </li>
          </ul>
        </section>

        <section>
          <h2>Acceptable Use</h2>
          <p>You agree not to:</p>
          <ul>
            <li>Use KAYO for unlawful, abusive, or fraudulent activity.</li>
            <li>
              Attempt to reverse engineer, interfere with, or disrupt the app or
              its infrastructure.
            </li>
            <li>Bypass subscription or entitlement controls.</li>
          </ul>
        </section>

        <section>
          <h2>Intellectual Property</h2>
          <p>
            KAYO, including its design, branding, software, and content, is
            owned by KAYO or its licensors and is protected by applicable
            intellectual property laws.
          </p>
        </section>

        <section>
          <h2>Disclaimers</h2>
          <p>
            KAYO is provided on an &quot;as is&quot; and &quot;as
            available&quot; basis. We do not guarantee uninterrupted or
            error-free operation. KAYO is a productivity and wellness tool and
            does not provide medical, psychological, or legal advice.
          </p>
        </section>

        <section>
          <h2>Limitation of Liability</h2>
          <p>
            To the maximum extent permitted by law, KAYO and its operators are
            not liable for indirect, incidental, special, consequential, or
            punitive damages, or loss of profits, data, or goodwill resulting
            from your use of the service.
          </p>
        </section>

        <section>
          <h2>Termination</h2>
          <p>
            We may suspend or terminate access to KAYO if you violate these
            terms or if required for security, legal, or operational reasons.
          </p>
        </section>

        <section>
          <h2>Changes to Terms</h2>
          <p>
            We may update these terms periodically. Continued use of KAYO after
            updates means you accept the revised terms.
          </p>
        </section>

        <section>
          <h2>Contact</h2>
          <p>
            Questions regarding these terms can be sent to{" "}
            <a href="mailto:kayo@keeganryan.co">kayo@keeganryan.co</a>.
          </p>
        </section>
      </article>
    </main>
  );
}
