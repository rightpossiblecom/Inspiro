import { Share2, Sparkles, Quote } from "lucide-react";
import Image from "next/image";

export function AppScreen() {
  return (
    <div className="flex flex-col h-full bg-zinc-50 dark:bg-black font-sans">
      {/* Status Bar Placeholder */}
      <div className="h-12 w-full bg-transparent shrink-0" />

      {/* AppBar */}
      <div className="px-4 py-3 flex items-center justify-between mb-4 border-b border-zinc-200/50 dark:border-zinc-800/50">
        <div className="flex items-center gap-2">
          <div className="w-6 h-6 relative overflow-hidden rounded">
            <Image src="/app_logo.png" alt="Inspiro" fill className="object-cover" />
          </div>
          <h1 className="text-lg font-bold text-zinc-900 dark:text-white tracking-tight">Inspiro</h1>
        </div>
      </div>

      {/* Content */}
      <div className="flex-1 px-4 overflow-y-auto pb-20 scrollbar-hide flex flex-col justify-center">
        
        {/* Quote Card */}
        <div className="mb-8 p-6 rounded-3xl bg-white dark:bg-zinc-900 border border-zinc-200 dark:border-zinc-800 shadow-xl shadow-brand-500/5 relative overflow-hidden">
          <div className="absolute top-0 right-0 w-24 h-24 bg-brand-500/10 rounded-bl-full -mr-4 -mt-4"></div>
          
          <Quote size={24} className="text-brand-500 mb-4 opacity-50" />
          
          <p className="text-xl font-bold text-zinc-900 dark:text-white leading-relaxed mb-4 font-serif italic">
            "Success is not final, failure is not fatal: it is the courage to continue that counts."
          </p>
          
          <p className="text-sm font-bold text-zinc-400 uppercase tracking-wider text-right">
            — Winston Churchill
          </p>
        </div>

        {/* Buttons */}
        <div className="space-y-4">
          <button className="w-full py-4 bg-zinc-900 dark:bg-white text-white dark:text-zinc-900 rounded-2xl font-bold shadow-lg flex items-center justify-center gap-2">
            <Sparkles size={18} />
            Inspire Me
          </button>
          
          <button className="w-full py-4 bg-zinc-100 dark:bg-zinc-900 text-zinc-600 dark:text-zinc-400 rounded-2xl font-bold flex items-center justify-center gap-2">
            <Share2 size={18} />
            Share Quote
          </button>
        </div>

      </div>
    </div>
  );
}
