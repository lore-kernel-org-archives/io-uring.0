Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6524ACC9B
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 17:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149121; cv=none; b=Elr3VuL6kLE24darcRkIQWQqlLoZ7KU3PRQoEL66WX7vSmRmDzqyBAZ60MeHDrq4OVpP77qIhx74mdQsOnA1UkO6hoF2L/zJrqrm1HxBNRBbPH6oVL6++veggzSBUJrEmCrlmaQ6rJ1kt+uUj/vxIQvdm+xolC3g1mvtbE2iu4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149121; c=relaxed/simple;
	bh=k3OTarJevq2L9zcrC5c0odON51Ym9WgieNS16JhSSvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aR7kLNKcrAo26Hg0hFuCKQBrXcKBLXgdx4kDCGhidzSUGH6xemO4Hxf/WbbWZ86cuC26hUBufqwD6IXOAyXXx1B1RsKwMYXjFMguO7leFzsABX5iA81tK0yD7cWKltw2H6MbpUsJGjFIqrtMAYLfrkj11NfwcYOlx06AnVilJVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=hYHJGu/2; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="hYHJGu/2"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso829232a34.1
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 10:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789149117; x=1789753917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9olr04AtyTbiPDIyx9X9sacFZEY3X0bYJ7/A2XJEuFA=;
        b=hYHJGu/2ziX4bBkGiewO5v1bBnuOmCJ2LEW/2wTKOMcv9ON1YAFGMVMyg0rID03hSb
         7VsedsnO/sxN3bQU9bDxp5mMYsASr66mWUEr/Bt2w1rPaHsNgAzSzTVbHK04CGjgEpjc
         uoG6dGpnUFQ1wStLJVDj27M8ZPQhSLKGccd9bzEqaCGr9jA31BFsYE3jgi2jQqrNGENc
         RiZ1uZqNsspWmBSqpvyWfw+nfl6JQUyTMk9P9kW5WJYqBGWtWWofkC+6Z7dM+oISpyNp
         nGEtgqNWZDEbUyPo25IKhBLjFedxj6eXDoUkyV5MYjkopPW56tls6bi3DpjzcJFiBSo5
         SXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149117; x=1789753917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9olr04AtyTbiPDIyx9X9sacFZEY3X0bYJ7/A2XJEuFA=;
        b=pOC/YESO2qY76oRILRmeizheN3S35XsbcxVzZgCmI/42Rl0+pGZs2ATmlyqK5Tjr5L
         rzpxfYaO7BaX2EczQbvwEzLrwE1a4wy6XkTH1K7xs0sR1peZ9xKA81eb9D5GoC90QFeh
         8P5fvb4bgI1J/Ll25EUDKbargt+PNUoJqRu4PBYSfGcyKi3mCuTj60KELkX4zfoIXWD2
         oATk2msCjkaagr3rcKwBZTZ99KhZVeDV4fhLx3juGo7lWzesiH42SK8815+jonUZZkrT
         Glez9/1OoBXpKnkhYtwUZKWpEeM177H+vf+QmQcdWJY0OSSOTwZ1BxueRiv3qm6WdcHS
         9k2w==
X-Forwarded-Encrypted: i=1; AKwUvBy86uPgIh4aakqGNvluGQ7yixypFU2pS3ZYIlyZ2JK+ZPHoCanvBV8AlqL+Srk51VI8o074GJT+8g==@vger.kernel.org
X-Gm-Message-State: AFuF++mZUH4MB+45cmYQBDnctqCFU7q9mCC48jOLGS6F6qThH2lHXkNP
	QFErfT/t7pFqB+ZHrjtu58893Doa2UeMi992JB0lv4u3ge5Yh+oJ86YcCP69n6aJxoA=
X-Gm-Gg: AYBFou3pG+nck2OiqUDvBXTjjamxwvUmJNEGnsBxVeYm5iCqc3Lp8nZDYhFCK2qG1qv
	MJ8LGI7cTc+Tkus5D0GQVEfsQ/CABltvngfupfX73C+SKe+rLwIRt5cK44TD0GZdQMEnZOTNQtO
	DEchH9gCJ8TuL6xg3iA6TPdx/h/jx2XqSPEsV+Jt0ZxVgwGn9CVdsW5K8BHOj3bXzauasMCNxa4
	pDHnXC2LWnKGpEX/1dCO+nBwpd7Gp26aQZucpqaHzRcYRWt3gVzxa719+TrWaHZR1R44Hymojxh
	msRsR527O+kI062y9mcUBawrQ+mpdPvWH5klEw6U08Rw47ARS/7yiu0F8PkJ6+I+1RAQJNc2kBA
	bI0w+7RVEuKrSNL/VixJXlmrq1RjTSZp3k9oct4VXrgYgxbfHxTSoMvWpVn0RMBlohnXQLq9vDv
	8rVngO7G9ts1o0gu8njNpiF2g0ivb05TpNG3gpgFMhHxzvXWyyg3z3exFW4ZJ2sZxLusRSn9nu8
	f7rX00aIt4iWDW7S5ELa7qCoS0oOxKnZmD6MzdSLM/v/Hjgdc016O6z
X-Received: by 2002:a05:6830:6abc:b0:7fa:ab72:9dfa with SMTP id 46e09a7af769-803ff447bcdmr4271484a34.18.1789149117393;
        Fri, 11 Sep 2026 10:51:57 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670d850sm3108041a34.17.2026.09.11.10.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:51:56 -0700 (PDT)
Message-ID: <54310fb2-d4b0-4b97-bc07-68e27e462b29@kernel.dk>
Date: Fri, 11 Sep 2026 11:51:55 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
To: Gabriel Krisman Bertazi <krisman@suse.de>, io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 tglx@kernel.org, mingo@redhat.com, peterz@infradead.org
References: <20260911154148.644489-1-axboe@kernel.dk>
 <87tsnv1ynh.fsf@mailhost.krisman.be>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87tsnv1ynh.fsf@mailhost.krisman.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 11:33 AM, Gabriel Krisman Bertazi wrote:
> Jens Axboe <axboe@kernel.dk> writes:
> 
>> Hi,
>>
>> io_uring issues requests inline with IO_URING_F_NONBLOCK and punts to
>> io-wq when that isn't possible. For a range of opcodes it isn't possible
>> at all, as there's no nonblocking path in the kernel for them: fsync,
>> statx, openat, the *at family, xattr, fadvise, splice, etc. Those are
>> punted unconditionally, and the punt costs a thread wakeup, a context
>> switch and a task_work completion round trip per request. io_uring HAS
>> to be cautious to prevent accidental blocking in the kernel, even if the
>> operations predominantly never block. Sad story. Examples of that are
>> things like an fdatasync that doesn't block, statx that hits dcache,
>> openat for O_TMPFILE, etc. All of those would've completed inline just
>> fine, but io_uring just cannot rely on that.
>>
>> This series issues those requests inline in blocking mode instead, and
>> only pays for the offload if the request actually blocks. But by the
>> time it blocks, the submitter is deep in the kernel with the request on
>> its stack, so the work can't be moved to another thread. What we can
>> move is the identity. If the submitting task blocks, an idle io-wq
>> worker takes over its user visible identity (tid, signal state,
>> credentials, scheduling attributes, cgroup, user register state),
>> finishes the io_uring_enter() call and returns to userspace as the
>> submitter. The original task finishes the request as an
>> io-wq worker and joins the pool. Userspace is none the wiser, hopefully,
>> the same tid came back from the syscall, it's just on a different
>> task_struct. Folks that have been around a while may remember earlier
>> attempts at this about 20 years ago.
> 
> This is both really cool and seems like very dangerous thing :) Count me

Oh yeah, it's definitely crazy and deeply an RFC.

> amazed.  I worry this impersonating method will become as tricky as the
> kthread impersonating model that you replaced with the user workers,
> though.  I haven't looked at your patches yet, but I wonder how you
> handle other tasks that have a reference to your task_struct.

That one was different, because these are normal threads, not kthreads.
They are created similarly to if you did pthread_create() in userspace,
this is what io-wq workers are already. So it's mostly as safe as io-wq
already is, by design, which is why the PF_IO_WORKER work happened and
why kthreads haven't been used since back in the early 5.x days.

So I don't think there's too much to worry about on the security front,
it's mostly a "this will confuse the application" kind of thing because
something has been missed. And yes that is no good either, but it's not
a security concern. That's VERY different from the kthread case, where
if you missed some kind of personality, then congrats you're now running
with fully elevated privileges.

> I was actually working something much simpler to improve this problem,
> which still require subsystems to cooperate, but largely reduces issue:
> 
> My idea was to reuse the non_block_count which already exists in
> task_struct preserved for every kernel config that has io_uring.  We we
> scope the inline path with it.  We then provide new mutex, semaphore
> callers that will check the flag and fail refusing to sleep, similar to
> a try_lock.  The new callers are required because we want subsystems to
> opt-in the behavior, properly clean after themselves, and return
> EWOULDBLOCK.  This is why we need to clean blocking paths in io_uring.
> sched throws a WARN_ON if we schedule out with the counter> 0, making it
> easy to find issues.

I think that would be a tough sell, mostly because of how many locking
primitives we have and how widely they are used, and how difficult (or
impossible) it is to introduce error paths for code that previously had
none. That alone would make it a non-starter for me. Let alone is that
it'd be a continual whack-a-mole kind of work, it'll never be fully
done.

> It has the downside of still requiring fixes to every path and we need
> to handle every new case that comes by, but it is much cleaner than
> plumbing a nonblock flag several layers down the stack across each
> subsystem or having subsystem-specific details in io_uring, which is
> what we have today.  On the upper side, it is much less complex than
> your approach. It also allow us to just back off during memory
> allocations that would block, solving the memory allocations anywhere in
> the submission path, not only inside ->issue(), which we discussed
> recently on discord.

I think you'll find it'll be a lot MORE complicated than my approach!
Backing out error handling is going to be impossible in some cases,
think file systems for example. How would those cases be handled?

> I'll give a try to this series and report back.

Thanks!

-- 
Jens Axboe
