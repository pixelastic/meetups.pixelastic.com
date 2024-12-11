---
layout: post
title: "HumanTalks Paris November 2024"
---

On November 12th, the second Tuesday of the month, the HumanTalks Paris Meetup took place. This time, I was fortunate to serve as both the host (because the event was held in Algolia), a speaker, and an organizer, as I had previously been a part of the organizing team when I lived in Paris.

This article serves as a recap of the talks from the session, offering insights for those who couldn’t attend.

## Take Control of Your Time: Scripts to Streamline Routine

In the first talk, Paul Royer shared his experience with automating routine tasks in his workflow. He explained how he struggled with an inefficient deployment process at work. The existing method required several manual steps, such as making a pull request, waiting for it to be validated, and then manually updating a configuration file in a separate repository. This repetitive task took up valuable time for Paul and his team, prompting him to explore automation as a solution.

 Paul initially considered using bash scripts for the automation but found the learning curve quite steep. Instead, he opted for JavaScript, a language he was already familiar with in his projects. By utilizing JavaScript, Paul was able to create a script to automate the task without introducing additional dependencies. This decision not only made it easier to implement but also simplified sharing the script with colleagues.

 The next challenge Paul faced during the scripting process was accommodating different development environments. He realized that certain assumptions about the file structure that worked on his machine didn't hold true for his team members (maybe they had the secondary repository stored somewhere else, maybe they had a different copy of it, etc.). To address this, he programmed the script to ask the user for the necessary configuration the first time it ran, storing these settings for future use. This approach balanced automation with flexibility, ensuring the tool could adapt to individual setups without becoming overly complex. Aiming for simplicity is always the best option, IMO. And simplicity doesn’t mean everything has to feel magical: it’s ok to ask for user input if the input asked is clear.

 Through this experience, Paul highlighted the importance of optimizing repetitive tasks wherever possible; the time saved will have a compound effect over time. For developers, automating routine aspects of work can help streamline processes and free up more time for more valuable tasks.

## Dependency Management

The next talk was on the subject of dependency management, presented by Sulidi Maimaitiming. He discussed how to handle and update dependencies effectively and how to evaluate the right timing for such updates. As someone interested in technical debt and code maintenance, I was especially interested in the challenges of keeping a tech stack up-to-date in a fast-evolving environment.

He mentioned that his team, working in a large bank, had a cutting-edge tech stack in 2020, which by now is starting to show signs of being outdated. It was a powerful reminder that what is considered "state of the art" today will eventually become obsolete.

 One of the key points Sulidi brought up was the trade-off between immediate and long-term benefits. He illustrated that with the eternal negotiation between developers who aim to prevent codebase decay and product teams pushing for new features.

His analogy made me think of offering a child a candy now versus ten candies later—they will likely choose immediate gratification. We often fall into the same cognitive biases in decision-making, potentially putting off essential updates in favor of quick gains.

He then introduced the concept of "cost of delay," which involves shifting the burden of proof by scheduling updates and asking stakeholders why a feature needs to be prioritized first. This approach helps weigh the cost of moving a feature's release against the benefits of staying updated.

While Sulidi's talk did not offer a definitive solution to the challenges of dependency management, it provided me with additional considerations and ideas to ponder, particularly the concept of the "cost of delay"..

## First Rule of Code Club: It's Forbidden to Code Too Much

The third talk was about efficiency and efficacy. Ali El Amrani discussed the idea that constantly coding isn't always beneficial. His presentation was full of movie references, and maybe they diverted from the message because I had a hard following what he wanted to say.

Ali opened his talk with a great quote: "There’s no point in doing efficiently what shouldn’t be done at all." This set the tone, emphasizing that “doing the right thing” is more important than “doing the thing right”. He then argued that focusing solely on efficiency without considering efficacy will lead to wasted resources and dissatisfied clients.

I found it difficult to fully grasp Ali’s message, as his talk felt confusing at times, with examples that didn’t clearly align with the definitions he provided. What I did understand left me somewhat dissatisfied, as it seemed to carry an elitist undertone, suggesting a divide between "good" and "bad" developers—the good ones being those who dedicate themselves to “building a cathedral”.

I myself take pride (and joy) in practicing what I consider software craftsmanship, but I also believe it’s not the only path to doing meaningful and valuable work. Ultimately, I did not really connect with that talk, so I can’t say I’m making Ali’s message justice here.

## Successful Slides: Essentials to Know

And I finally myself took the stage to talk about a topic close to my heart: how to deliver successful presentations. As someone who frequently conducts internal training at Algolia, I focus on helping colleagues express their knowledge confidently on stage. My goal is to provide practical tips that work for most people, especially those not accustomed to speaking in front of an audience.

One key point I emphasize is the importance of using slides. While skilled speakers might pull off talks without slides, I believe that for most of us, slides are essential in maintaining the audience’s attention. They serve as a secondary channel to convey our message, complementing what we say with visual aids. This dual-channel approach helps the audience grasp and retain the content more effectively. However, it's crucial to remember that slides should support, not overshadow, what you’re saying.

I brought attention to what I consider the Golden Rule for creating effective slides: one idea per slide. It’s really important to remember that the value of a slide is not in the amount of information it contains, but in its clarity to convey your message.

Having one idea per slide not only aids the audience’s understanding but also helps you as the presenter. It acts as a cheat sheet, guiding your speech and highlighting the main points you want to cover.

## Conclusion

I had a few interesting discussions with attendees after the talk (discussing public speaking, the role of a Dev Advocate and Django/Rails differences).

Hosting this meetup at Algolia was a once again a great experience—we love welcoming events like this to our space. If you’ve read this far, I hope to see you at a future event we organize, and if you’re a meetup organizer yourself, don’t hesitate to reach out! We have an amazing venue and would be happy to host your next gathering.