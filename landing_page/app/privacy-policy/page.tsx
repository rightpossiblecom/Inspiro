"use client";

import { PageHeader } from "@/components/layout/PageHeader";
import { Footer } from "@/components/landing/Footer";

export default function PrivacyPolicy() {
  return (
    <main className="min-h-screen bg-white dark:bg-zinc-950">
      <PageHeader
        title="Privacy Policy"
        description="Last Updated: February 7, 2026"
      />

      <section className="py-20">
        <div className="container mx-auto px-4 md:px-6">
          <div className="max-w-4xl mx-auto">
            {/* Document Container */}
            <div className="bg-white dark:bg-zinc-900 rounded-3xl p-8 md:p-12 shadow-xl border border-zinc-100 dark:border-zinc-800">

              <div className="prose dark:prose-invert prose-zinc prose-lg max-w-none font-sans">
                <p className="lead text-xl text-zinc-600 dark:text-zinc-400 font-medium leading-relaxed mb-12">
                  At Inspiro ("we," "our," or "us"), we believe your inspiration is personal. 
                  We are committed to protecting your privacy and ensuring you have a safe, harmless experience.
                </p>

                <div className="grid gap-12">
                  {/* Section 1 */}
                  <div className="border-b border-zinc-100 dark:border-zinc-800 pb-12">
                    <h2 className="text-3xl font-black text-zinc-900 dark:text-white tracking-tight mb-6 flex items-center gap-3">
                      <span className="flex items-center justify-center w-8 h-8 rounded-full bg-brand-100 dark:bg-brand-900/30 text-brand-600 dark:text-brand-400 text-sm font-bold">1</span>
                      No Data Collection
                    </h2>
                    <div className="bg-brand-50 dark:bg-brand-900/10 p-6 rounded-2xl border border-brand-100 dark:border-brand-800/30 mb-6">
                      <p className="mb-0 font-medium text-brand-900 dark:text-brand-100">
                        Inspiro is designed as a standalone utility. <strong>We do not collect, store, or transmit your personal data, location, or usage habits.</strong> Everything stays on your device.
                      </p>
                    </div>
                  </div>

                  {/* Section 2 */}
                  <div className="border-b border-zinc-100 dark:border-zinc-800 pb-12">
                    <h2 className="text-3xl font-black text-zinc-900 dark:text-white tracking-tight mb-6 flex items-center gap-3">
                      <span className="flex items-center justify-center w-8 h-8 rounded-full bg-brand-100 dark:bg-brand-900/30 text-brand-600 dark:text-brand-400 text-sm font-bold">2</span>
                      Information We Don't Collect
                    </h2>
                    <p>To be crystal clear, here is what we <strong>do not</strong> collect:</p>

                    <div className="grid md:grid-cols-2 gap-6 mt-6">
                      <div className="p-6 rounded-2xl bg-zinc-50 dark:bg-zinc-950/50 border border-zinc-100 dark:border-zinc-800">
                        <h4 className="font-bold text-zinc-900 dark:text-white mb-2">Personal Identity</h4>
                        <p className="text-sm text-zinc-600 dark:text-zinc-400 mb-0">
                          We don't know who you are. No names, emails, or phone numbers.
                        </p>
                      </div>
                      <div className="p-6 rounded-2xl bg-zinc-50 dark:bg-zinc-950/50 border border-zinc-100 dark:border-zinc-800">
                        <h4 className="font-bold text-zinc-900 dark:text-white mb-2">Usage Data</h4>
                        <p className="text-sm text-zinc-600 dark:text-zinc-400 mb-0">
                          We don't track which quotes you like or how often you open the app.
                        </p>
                      </div>
                    </div>
                  </div>

                  {/* Section 3 */}
                  <div className="border-b border-zinc-100 dark:border-zinc-800 pb-12">
                    <h2 className="text-3xl font-black text-zinc-900 dark:text-white tracking-tight mb-6 flex items-center gap-3">
                      <span className="flex items-center justify-center w-8 h-8 rounded-full bg-brand-100 dark:bg-brand-900/30 text-brand-600 dark:text-brand-400 text-sm font-bold">3</span>
                      No Accounts Required
                    </h2>
                    <p>
                      You do not need to create an account to use Inspiro. The app works instantly upon download.
                    </p>
                  </div>

                  {/* Section 4 */}
                  <div>
                    <h2 className="text-3xl font-black text-zinc-900 dark:text-white tracking-tight mb-6 flex items-center gap-3">
                      <span className="flex items-center justify-center w-8 h-8 rounded-full bg-brand-100 dark:bg-brand-900/30 text-brand-600 dark:text-brand-400 text-sm font-bold">4</span>
                      Contact Us
                    </h2>
                    <p>
                      If you have questions about this Privacy Policy, please contact us at:
                    </p>
                    <a href="mailto:hello@inspiro.app" className="inline-flex items-center gap-2 text-brand-600 dark:text-brand-400 font-bold no-underline hover:underline">
                      hello@inspiro.app
                    </a>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <Footer />
    </main>
  );
}
