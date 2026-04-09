import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Privacy Policy | KAYO",
  description:
    "How KAYO handles data, permissions, analytics, and subscriptions.",
};

export default function PrivacyPage() {
  return (
    <main className="legal-page">
      <article className="legal-shell">
        <p className="legal-kicker">KAYO</p>
        <h1>Privacy Policy</h1>
        <p className="legal-meta">Effective date: April 9, 2026</p>

        <section>
          <h2>Overview</h2>
          <p>
            KAYO is a screen-time and focus app designed for founders, builders,
            and high-performance users. This policy explains what data we use,
            why we use it, and your choices.
          </p>
        </section>

        <section>
          <h2>Information We Process</h2>
          <p>Depending on your usage and settings, KAYO may process:</p>
          <ul>
            <li>
              App usage events (for example, onboarding steps, focus-session
              actions, and paywall views).
            </li>
            <li>
              Subscription and entitlement status through RevenueCat and Apple
              App Store billing infrastructure.
            </li>
            <li>
              Device and app diagnostics needed to keep the app stable and
              improve performance.
            </li>
          </ul>
          <p>
            We do not intentionally collect direct personal identifiers such as
            your name, physical address, or phone number in analytics events.
          </p>
        </section>

        <section>
          <h2>Permissions</h2>
          <p>
            KAYO may request permissions that are relevant to the product
            experience, including:
          </p>
          <ul>
            <li>
              <strong>Screen Time-related access</strong> to support focus and
              usage insights functionality.
            </li>
            <li>
              <strong>Notifications</strong> to send reminders and
              accountability prompts.
            </li>
          </ul>
          <p>
            You can manage app permissions at any time in your iOS Settings.
          </p>
        </section>

        <section>
          <h2>Third-Party Services</h2>
          <p>KAYO uses the following processors and platforms:</p>
          <ul>
            <li>
              <strong>RevenueCat</strong> for subscription status, entitlement
              checks, and paywall experiment support.
            </li>
            <li>
              <strong>PostHog</strong> for product analytics and onboarding
              experimentation.
            </li>
            <li>
              <strong>Apple App Store / App Store Connect</strong> for billing,
              transactions, and Apple-provided analytics.
            </li>
          </ul>
          <p>
            These services process data under their own terms and privacy
            policies. We configure them to support a minimal-PII analytics
            posture for KAYO.
          </p>
        </section>

        <section>
          <h2>How We Use Data</h2>
          <ul>
            <li>Operate core features of the app.</li>
            <li>Measure feature quality and product performance.</li>
            <li>
              Improve onboarding and focus outcomes through controlled
              experimentation.
            </li>
            <li>Manage subscriptions and entitlement access.</li>
            <li>Detect abuse, fraud, and technical issues.</li>
          </ul>
        </section>

        <section>
          <h2>Data Retention</h2>
          <p>
            We keep data only as long as necessary for the purposes listed
            above, legal compliance, and legitimate business operations.
            Retention periods may vary by service provider and data type.
          </p>
        </section>

        <section>
          <h2>Your Choices and Rights</h2>
          <ul>
            <li>
              Disable notifications and other permissions through iOS Settings.
            </li>
            <li>
              Control subscription status through your Apple ID subscription
              settings.
            </li>
            <li>
              Request privacy support by contacting us at the email below.
            </li>
          </ul>
        </section>

        <section>
          <h2>Children&apos;s Privacy</h2>
          <p>
            KAYO is not directed to children under 13, and we do not knowingly
            collect personal data from children under 13.
          </p>
        </section>

        <section>
          <h2>Changes to This Policy</h2>
          <p>
            We may update this Privacy Policy from time to time. If we make
            material changes, we will update the effective date and provide
            notice as required by applicable law.
          </p>
        </section>

        <section>
          <h2>Contact</h2>
          <p>
            Questions about privacy can be sent to{" "}
            <a href="mailto:kayo@keeganryan.co">kayo@keeganryan.co</a>.
          </p>
        </section>
      </article>
    </main>
  );
}
