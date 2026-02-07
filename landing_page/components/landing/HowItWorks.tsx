"use client";

import { MousePointerClick, Sparkles, Heart } from "lucide-react";

const steps = [
  {
    icon: <MousePointerClick size={24} />,
    title: "1. Open App",
    description: "Launch Inspiro whenever you need a quick mental boost.",
  },
  {
    icon: <Sparkles size={24} />,
    title: "2. Tap 'Inspire Me'",
    description: "Hit the big button to instantly reveal a motivational quote.",
  },
  {
    icon: <Heart size={24} />,
    title: "3. Feel Good",
    description: "Read, smile, and carry that positivity with you. Or share it!",
  },
];

export function HowItWorks() {
  return (
    <section id="how-it-works" className="py-24 bg-white dark:bg-zinc-950">
      <div className="container mx-auto px-4 md:px-6">
        <div className="flex flex-col md:flex-row items-center gap-16">
          <div className="md:w-1/2">
            <h2 className="text-3xl md:text-5xl font-black text-zinc-900 dark:text-white mb-6 tracking-tight">
              Inspire yourself in <br className="hidden lg:block" />
              <span className="text-brand-500">three steps.</span>
            </h2>
            <p className="text-lg text-zinc-600 dark:text-zinc-400 font-medium mb-8 leading-relaxed">
              No signups, no onboarding, no complicated menus. Inspiro is designed for instant gratification.
            </p>

            <div className="space-y-8">
              {steps.map((step, index) => (
                <div key={index} className="flex gap-6">
                  <div className="shrink-0 relative">
                    <div className="w-12 h-12 rounded-2xl bg-zinc-900 dark:bg-white text-white dark:text-zinc-900 flex items-center justify-center font-bold relative z-10 shadow-xl">
                      {step.icon}
                    </div>
                    {index !== steps.length - 1 && (
                      <div className="absolute top-12 left-1/2 -translate-x-1/2 w-0.5 h-16 bg-zinc-100 dark:bg-zinc-800" />
                    )}
                  </div>
                  <div>
                    <h3 className="text-xl font-bold text-zinc-900 dark:text-white mb-2">
                      {step.title}
                    </h3>
                    <p className="text-zinc-500 dark:text-zinc-400 font-medium">
                      {step.description}
                    </p>
                  </div>
                </div>
              ))}
            </div>
          </div>

          <div className="md:w-1/2 relative">
            <div className="relative z-10 bg-zinc-50 dark:bg-zinc-900 rounded-[2.5rem] p-8 border border-zinc-100 dark:border-zinc-800 shadow-2xl">
              
              {/* Mockup Screen */}
              <div className="aspect-[9/16] bg-white dark:bg-zinc-950 rounded-2xl border border-zinc-200 dark:border-zinc-800 flex flex-col items-center justify-center p-6 text-center shadow-inner relative overflow-hidden">
                
                {/* Status Bar Mock */}
                <div className="absolute top-4 w-full px-6 flex justify-between opacity-30">
                    <div className="w-12 h-3 bg-zinc-900 dark:bg-white rounded-full"></div>
                    <div className="flex gap-1">
                        <div className="w-4 h-3 bg-zinc-900 dark:bg-white rounded-full"></div>
                        <div className="w-4 h-3 bg-zinc-900 dark:bg-white rounded-full"></div>
                    </div>
                </div>

                <div className="mb-8">
                    <Sparkles size={40} className="text-brand-500 mx-auto mb-4" />
                    <h4 className="text-2xl font-bold text-zinc-800 dark:text-white mb-2">Inspiro</h4>
                </div>

                <div className="p-6 bg-brand-50 dark:bg-brand-900/10 rounded-2xl mb-8 w-full">
                    <p className="text-lg font-serif font-bold text-zinc-800 dark:text-zinc-100 italic">
                        "The only way to do great work is to love what you do."
                    </p>
                    <p className="text-sm text-zinc-500 mt-2">— Steve Jobs</p>
                </div>

                <div className="w-full h-12 bg-zinc-900 dark:bg-white rounded-xl shadow-lg flex items-center justify-center text-white dark:text-zinc-900 font-bold">
                    Inspire Me
                </div>

              </div>

            </div>

            {/* Decorative */}
            <div className="absolute -top-10 -right-10 w-40 h-40 bg-brand-500/20 rounded-full blur-3xl" />
            <div className="absolute -bottom-10 -left-10 w-40 h-40 bg-indigo-500/20 rounded-full blur-3xl" />
          </div>
        </div>
      </div>
    </section>
  );
}
