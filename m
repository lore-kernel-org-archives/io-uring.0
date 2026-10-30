Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367250;
	b=RLUkvJgo4xn+gRmFtAhB/3rHj/J4lGswd7LdCmM6DaPxXcnlaCn8wI6+hCKk5FTb5fEp
	 Xa/bGzPbxU1cZbYZ+iMhu8qQXu+pw4RlnzXf11sLtSGFJnT7dPYgviFyy/kYL5Fs8h4nf
	 r3k+a1DPH902z8ypLF5cb7ZVUz/aS2lUrUYKYhueiU8RnMRvrc57bsTjBFbSq9glGPJ3g
	 VTKGvuTAIaTsZBPbyj46tny2+FmRhOhwdM2Zq8X/YnzMKvDnh1gFRUUTXmetRlmYmGQhA
	 xYn9c6vq5wbJyapffC69YjMM1EDmDZJFY+L6zetd+KcoYHrCKYbyaph8X6FyFN3A7Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SNNsuLPOQBAcoudI8YcBJc/3vSOuOzo4By+QJyHiws0=;
	b=nGCc0VLShenOKHLPyiKZv74QFRajqoZXE/Wzo1sTMXLllp+0ciJrk798e4z0NDv0DCBd
	 UQCnykE7tdqHzuc9srm93umfKlNZAzRX0UWShHgG1Rh623/5FmXMDPF/caD0cCCGP1boB
	 BN8AZxhAp/h6nXanQGWi1NEWmVORZ6aW+wKu0aUZNQd1THbIMV7sC6Z2sSMqPRGgFfHWf
	 0821lpkXVJvqPuxNs7kWcAGOeM7r31cJay0ZXsuBgmv21B3JscCHCHOpGMFABfevvjPmv
	 lDZPw81m8QAU0r40t3obFYB3OkmuVJ/3jqhx4LmN9dXFfC2vS8fbo3R8yJ54fufJvug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Niz1Izue;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E744606A320
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 13:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E744606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Niz1Izue
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso1527341eec.0
        for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793367248; x=1793972048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNNsuLPOQBAcoudI8YcBJc/3vSOuOzo4By+QJyHiws0=;
        b=Niz1Izuetx9UOzHJGBPNFps6D1oZqdT4oRH+GXxGNVK1yOU6rvvBq3fsHeIQ0P7gG3
         EtcxICg1qvcWgHalASLBR30Js8tzSPOWW/DTNx9M1O9d5RCQAwvzld9dIvT3+HUfTr8z
         dPhQhBcDXtl/dnIkOHrUaEIdGnKK/5lTFsvdy4bePDHVtMG37UHiZwRAbM6+GOZ+LWyE
         i3oEn8qKac7NEfjU6FuB1ZCSkcqnlDLf9Md9Sx7idwcWJPDYFMe0bFHsUe/NyOWD4QQg
         LdqOjIO/hhzAVgQ/5PNt7XVqy8CxZVyiEY3bHKEav8Y3njj5sa5WA13Oo+OuWoWn8hBs
         Mcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367248; x=1793972048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNNsuLPOQBAcoudI8YcBJc/3vSOuOzo4By+QJyHiws0=;
        b=G/+hJ2+tem5+VgIA51eXUrpmYLsFJLtgOkVP38YOVc8ICnWuwKvF7eDSQxGqSFeZRK
         O/DJYOvzZfdTXitRVBeW1XwbY9JuFhkYXvTsOChxKem1M2dF44cBTjPEJauOmg0zoOHx
         Lab1rElTnurWFoC6mfItG2VWxQfBOp0yK/ZghkYRTXWR7COVpIvrt2kwKTE+9uxIILc/
         YDVyz11pzu/t62fkdwOsdAqsl36LyfZlCAinbW/q+CokbPNVmQFDYCB4pkyy2oQLBo82
         WTxaNh53KTpRG6lWqsyGtOAz+7h0MOeTMhp3JHGuVOtN1vr48TVHeHvqm3L3tPK+wYhE
         OKAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSbhxibA/AQgqDzi2QVintHHdH+HtU4L1JLrJmySjr8GzMe4klZm9Otz3t6eZdWE4JPN52IuIO0A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLqybuV81kOCo55FWnmdVtA1HRMDVPSXChoAERsIEudKNumFw/T
	f/56/YYPIHVcbDY5qBc6py9PKO0Hh/sDXiLsnDnChsiGW/DS6LFzU7dtVIRImzi1JcLFpaCaDp4
	mKkhzzpE=
X-Gm-Gg: AYBFou1b4RVChI3okHjA+l9jtuTJOFwKCMCF0mGPMDzpuxjP+Rr5MVg5R2H4HDzwwHW
	tDkjpqyP4RBDOqPlUdZNfs3yEoGnz2P8B4UgWxDhas7LJFvUXdhySVndyPItzIQX894A4lf7fTy
	wekYw5Pvp7LmcTgnklODSVqB84+AnjmU4LSIVVYfkzlId3yPFLpmKGOXnrHEkBoDyR6VRlSLykH
	PFhIMEgFf/vcRVp79iSl1rr7raaTYD0FfgQPN49e+IMUfvjChHhL4NlNyLJ3mBjxAW42dJDG0E8
	nl0thczWSoIFkTbQiFTzKgqgk+iQGn3cWssTdsMnzCYyLg6rUPRVp1IZxdWRBIMHVM7Wb4EoZL0
	DYcE+WEHDk/U91znv2gD8nuMNnhnkIv8Y2+/nLne3rJdwOC+68CiRgm4o/qFYJQ3lZ6npfKqvPJ
	R3EJd2Jybf1piOu6lNLGEa2zMsTDkFEujW9F1kqVssBCq6Zdk/1Aa8gHjsPvozPxoTlHQbMK5Ep
	vgesMIGR95yyuTXudVQujeQsdThcHReRbGCLC+vZxC0W59QR9SM6ar0ZNqLK6msr0Y6UoTHxYOZ
	QdzXcKBEYqVX0gGVKvgYbv2Vy1diK5SeBEW78TFlr388wIfwmgiSTJK6hRPll+xLdQ/P46u0/c9
	C2jx+5iYl41ZVxz/d3Jho6gZB8WGOwP5oDA==
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr3843824eec.29.1793367248412;
        Fri, 30 Oct 2026 06:34:08 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1easm6895074eec.5.2026.10.30.06.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:34:07 -0700 (PDT)
Message-ID: <8d7eeef5-7308-40c2-8670-733a69e24fae@kernel.dk>
Date: Fri, 30 Oct 2026 07:34:06 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] io_uring/cancel: drop sqd->lock while SQPOLL waits
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Chris Mason <mason@kernel.org>, io-uring@vger.kernel.org
References: <20261028164732.1264069-1-axboe@kernel.dk>
 <20261028164732.1264069-9-axboe@kernel.dk>
 <20261030012506.10611-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261030012506.10611-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 7:25 PM, Karl Mehltretter wrote:
>> diff --git a/io_uring/cancel.c b/io_uring/cancel.c
>> index 6f7a6cf356c2..79b5c133319b 100644
>> --- a/io_uring/cancel.c
>> +++ b/io_uring/cancel.c
>> @@ -703,7 +703,16 @@ __cold void io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd)
>>  		}
>>  
>>  		if (loop) {
>> +			/*
>> +			 * A request that runs in io-wq and doesn't end makes
>> +			 * each round come here. Don't hold sqd->lock for that
>> +			 * long either.
>> +			 */
>> +			if (sqd)
>> +				mutex_unlock(&sqd->lock);
>>  			cond_resched();
>> +			if (sqd)
>> +				mutex_lock(&sqd->lock);
>>  			continue;
>>  		}
> 
> Doesn't dropping sqd->lock here allow IORING_SETUP_ATTACH_WQ to attach
> to an SQPOLL thread that is already exiting?
> 
> io_sq_offload_create() checks !sqd->thread under sqd->lock to avoid
> attaching to a dying thread:
> 
> 	/* don't attach to a dying SQPOLL thread, would be racy */
> 	ret = (attached && !sqd->thread) ? -ENXIO : 0;
> 
> Previously, once io_sq_thread() left its main loop, it held sqd->lock
> across io_uring_cancel_generic() until it cleared sqd->thread. With this
> unlock, io_sq_offload_create() can take sqd->lock while cancellation is
> waiting, see sqd->thread still set, add the new ctx to sqd->ctx_list,
> and succeed. io_sq_thread() then finishes canceling, clears sqd->thread,
> and exits without ever servicing the new ring.
> 
> When testing this race in a VM, io_uring_setup() succeeds instead of
> failing with -ENXIO, and the new ring immediately fails with -EOWNERDEAD
> on io_uring_enter().
> 
> Maybe io_sq_thread() could set an exiting bit in sqd->state before
> calling io_uring_cancel_generic(), and io_sq_offload_create() could
> check that alongside !sqd->thread?

This is narrower than it looks. The stop bit is only set once the last
ring has dropped the sqd, at which point there's no fd left to attach
through. So the only exit that can be caught is the one on a fatal
signal, and since that's group wide and attaching requires the same
thread group, the attacher is also dying. That window isn't new, between
an attach and the thread noticing the signal, which is what -EOWNERDEAD
is there for.

But no reason not to make the check see it. I've queued up the below,
what do you think? It sets IO_SQ_THREAD_SHOULD_STOP in io_sq_thread()
before it cancels, and tests that bit in io_sq_offload_create()
alongside sqd->thread. Then no new state needed.

diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
index 49c52284ecdd..c833e776320d 100644
--- a/io_uring/sqpoll.c
+++ b/io_uring/sqpoll.c
@@ -433,6 +433,12 @@ static int io_sq_thread(void *data)
 	if (io_sq_tw_pending())
 		io_sq_tw(UINT_MAX);
 
+	/*
+	 * Cancelation drops sqd->lock while it waits, and a ring could attach
+	 * to a thread that is on its way out. A fatal signal doesn't set the
+	 * bit, so set it here for io_sq_offload_create() to see.
+	 */
+	set_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state);
 	io_uring_cancel_generic(true, sqd);
 	rcu_assign_pointer(sqd->thread, NULL);
 	put_task_struct(current);
@@ -502,7 +508,10 @@ __cold int io_sq_offload_create(struct io_ring_ctx *ctx,
 		list_add(&ctx->sqd_list, &sqd->ctx_list);
 		io_sqd_update_thread_idle(sqd);
 		/* don't attach to a dying SQPOLL thread, would be racy */
-		ret = (attached && !sqd->thread) ? -ENXIO : 0;
+		ret = 0;
+		if (attached && (!sqd->thread ||
+		    test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state)))
+			ret = -ENXIO;
 		io_sq_thread_unpark(sqd);
 
 		if (ret < 0)

-- 
Jens Axboe
