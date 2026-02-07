"use client";

import { motion } from "framer-motion";
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger
} from "@/components/ui/accordion";

const FAQS = [
  {
    question: "Do I need to create an account?",
    answer: "No. Inspiro works instantly without any signup. Just open the app and get inspired."
  },
  {
    question: "Is it free to use?",
    answer: "Yes, Inspiro is completely free to download and use."
  },
  {
    question: "Can I share the quotes?",
    answer: "Absolutely! There's a share button that lets you easily send quotes to friends or post them on social media."
  },
  {
    question: "Is my data private?",
    answer: "Yes. We don't track your behavior, collect personal data, or store your history. Everything is private."
  },
  {
    question: "Does it work offline?",
    answer: "Yes! Inspiro works perfectly even without an internet connection."
  }
];

export function FAQ() {
  return (
    <section id="faq" className="py-24 bg-white dark:bg-zinc-950">
      <div className="container mx-auto px-4 md:px-6">
        <div className="text-center max-w-3xl mx-auto mb-16">
          <h2 className="text-3xl md:text-5xl font-black text-zinc-900 dark:text-white mb-6 tracking-tight">
            Frequently Asked <span className="text-brand-500">Questions</span>
          </h2>
          <p className="text-lg text-zinc-600 dark:text-zinc-400 font-medium font-sans">
            Everything you need to know about Inspiro.
          </p>
        </div>

        <div className="max-w-3xl mx-auto">
          <Accordion type="single" collapsible className="w-full space-y-4">
            {FAQS.map((faq, index) => (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 10 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ duration: 0.3, delay: index * 0.1 }}
              >
                <AccordionItem
                  value={`item-${index}`}
                  className="border border-zinc-200 dark:border-zinc-800 rounded-2xl px-6 bg-zinc-50/50 dark:bg-zinc-900/10 overflow-hidden"
                >
                  <AccordionTrigger className="hover:no-underline py-6 text-lg font-bold text-zinc-900 dark:text-white text-left tracking-tight">
                    {faq.question}
                  </AccordionTrigger>
                  <AccordionContent className="text-zinc-600 dark:text-zinc-400 text-md font-medium leading-relaxed pb-6 font-sans">
                    {faq.answer}
                  </AccordionContent>
                </AccordionItem>
              </motion.div>
            ))}
          </Accordion>
        </div>
      </div>
    </section>
  );
}
