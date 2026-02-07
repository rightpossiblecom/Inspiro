"use client";

import { Sparkles, Zap, Share2, Shield, Heart, Smile } from "lucide-react";

const features = [
  {
    icon: <Sparkles size={24} />,
    title: "Daily Quotes",
    description: "Get a fresh dose of motivation every single day to start your morning right.",
  },
  {
    icon: <Zap size={24} />,
    title: "Instant Inspiration",
    description: "Need a boost? Just tap 'Inspire Me' and get a quote instantly.",
  },
  {
    icon: <Share2 size={24} />,
    title: "Share the Love",
    description: "Easily share your favorite quotes with friends and family via text or social media.",
  },
  {
    icon: <Shield size={24} />,
    title: "Privacy First",
    description: "No tracking, no accounts, no data collection. Your peace of mind matters.",
  },
  {
    icon: <Heart size={24} />,
    title: "Curated Content",
    description: "Hand-picked quotes that uplift, encourage, and motivate without being preachy.",
  },
  {
    icon: <Smile size={24} />,
    title: "Simple Interface",
    description: "A clean, distraction-free design that focuses on one thing: making you feel good.",
  },
];

export function Features() {
  return (
    <section id="features" className="py-24 bg-zinc-50 dark:bg-zinc-900/50">
      <div className="container mx-auto px-4 md:px-6">
        <div className="text-center max-w-3xl mx-auto mb-16">
          <h2 className="text-3xl md:text-5xl font-black text-zinc-900 dark:text-white mb-6 tracking-tight">
            Simple. <span className="text-brand-500">Inspiring.</span>
          </h2>
          <p className="text-lg text-zinc-600 dark:text-zinc-400 font-medium">
            Inspiro is built to give you that quick spark of positivity whenever you need it.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {features.map((feature, index) => (
            <div
              key={index}
              className="p-8 rounded-3xl bg-white dark:bg-zinc-950 border border-zinc-100 dark:border-zinc-800 hover:border-brand-200 dark:hover:border-brand-900/50 transition-colors group"
            >
              <div className="w-12 h-12 rounded-2xl bg-brand-50 dark:bg-zinc-900 flex items-center justify-center text-brand-600 dark:text-brand-400 mb-6 group-hover:scale-110 transition-transform duration-300">
                {feature.icon}
              </div>
              <h3 className="text-xl font-bold text-zinc-900 dark:text-white mb-3">
                {feature.title}
              </h3>
              <p className="text-zinc-500 dark:text-zinc-400 font-medium leading-relaxed">
                {feature.description}
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
