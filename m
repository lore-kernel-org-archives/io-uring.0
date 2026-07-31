Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B3D411FB4
	for <io-uring@vger.kernel.org>; Fri, 31 Jul 2026 15:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510218; cv=none; b=Sz8RmQuAQWaSRVh8B9++FeWEp4xN5kCrq4cWAuSoL+mVpgIcwfAHrA4Hlxso8zeOupVMykkXGsjdpb9JAT46F67GCfAew1AaqiXGZ9APGloRimfY57cWtEhnKUg7qXMFyOjgM0jcWK42DLlP17fgcZfPBaP02kaqwySNn9TWUas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510218; c=relaxed/simple;
	bh=6/CNlPNYU6kgWajfaLgIveCVtakvelDM7nTd2OKsQs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=je/EcPPFeDTpB6vDKu1kCTm7ZtsgXj1zJ8q3gSbFGeVPqdIeYsUtts5CEBmrfCHEyJHYFTsHFoIqUS+p3dqiBzd+hXM1Q+uK83I7TwvYcK1Rr3aE1cmyViEjqxRpkY1NGs68uYsxhp4+dZxWDINEopAhuXYAbhTt/bphqRLBhJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=zBTpXXhU; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="zBTpXXhU"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6aae3e18607so358171eaf.3
        for <io-uring@vger.kernel.org>; Fri, 31 Jul 2026 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785510213; x=1786115013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+Mb8GC1uJx0jhs18l79B+Kqw1w0ITSCvV2PCYoDYXE=;
        b=zBTpXXhU1SXydJ4bwQ3E5XhJD5MtDVuNaOwYvbVWH3rt/ZY+UR984IyQF2DqpbzGwi
         tokoCvuLq88Qw94YSW1wqy7TxSRO2zR//to0pih7BxlpzT5SPNTGw6sQP9pAYAqwK5fj
         2nvY5ItvCYOTDBBu22HE+BU2xajJ1o43YDkVas80lL97tVIcQZAYUT423XeK6uZBHiZO
         uoFlOUSsdQTMv6RuTfpjZ22BHot72603luOfkiyxuRmqyK8q1Ro3L/L+cQCWSkjcHK6I
         j3epA/xxmDR9PJ5Mg+IbEQ9HKEsOzi3uA5dMT7+gScRL18tKS0l9g1/hF5erSCf80/Mb
         QlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510213; x=1786115013;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+Mb8GC1uJx0jhs18l79B+Kqw1w0ITSCvV2PCYoDYXE=;
        b=HAH1LhNksu1tTLYM49CYSenIvLraffnCzBJcNHQHMjFCv2830KcACfCW1qmIg2R657
         1uGJmsx2h4TjxQ4RbR0t1etsoryPsLY9jESvrUg/LPSqLHaV3D82sjcKQq6Qu3J1WOL5
         LXIAGQUsU5QGOjGBdhRJANUUZx5eDOITPRBpeRrW2rFs9oOVGkctVU76JzmqQpCa7kTx
         805xHe93SZ6l/VPsVvVOE3AI1tIOW6R0OOpacs8E1NRCl3NnvVn9RcwZpjufUitLMgT0
         1VSJNOQXiD9gFIBtiQKcjhroa6zuo3Adx2UVRT9XAkZWpXFVhEoNcNQZb3YKLD2WxD+/
         d38w==
X-Forwarded-Encrypted: i=1; AHgh+Rpujj7z4sh90ZQyryzd/7ED95MiQOyIxwHnEiusZZZ5NM5OteInQyseqUGMsoL1kN44JnD2p65MUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUrNU+WAc/+UJG01incQ2/UWctp3sWXmWDxOx1waWElOb++6+s
	04kbXLBeoWUyrhlYKLeNuyTmuQ5wSWAzTgaWwiiHbeLJl751x9Y/Y5rsURYwHxp2pOQ=
X-Gm-Gg: AR+sD12An2zdspurw9BfKLjho/DCDcyYItL8Ug8fqkCjvPZdRH9Q0M9kHKNOxejr6XN
	41LI00+G1pDT1YahfAl1PWuAriixhU2ZSQJnYPHBwkfM+zT3PuWza0l1fSJm2JHEaGoQ7nwFb0k
	qB3Q8NB0GrPXXann6NUDSyPsAa9gTHsdUl7BJZHdyfzdkAG8ZsqlW656MW6BLs2wIWUZGuOUnYS
	U+HDtFcYwsnTIvqTUZY2MIERuWaunWpO5M70hgh6YhIufGaoRsnZOW6cN7IaN9IZVHNxRdCbR4b
	OV1QFxqzRiwacdY1s1S3MrVdvhHGyGe8hrHBxzQ6AdhW3jZNN5hGB5Wihr0WpNDNvRsQ+wIDF75
	JavBQttOvQGg09POzTJVS7Ya4TpZiE6F/skrxo/d+Sh72lOpQbmeyhvqRr9Lpgf+gljQfj3Dow9
	IqKdu93xHQ2lnSNTPBLtsl9AvfzeZYGLBvvHXiXYdDlJP1ju6R8lRLJAEMKeEUUOvrbAO8lV0SO
	1x+IS+gMZ8tjiB0osYPlnrDtjMJM2sOz+ALq+4bE3rDqRY=
X-Received: by 2002:a05:6820:2acd:b0:6ac:a994:8a02 with SMTP id 006d021491bc7-6ae4320bb65mr669668eaf.12.1785510213169;
        Fri, 31 Jul 2026 08:03:33 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f66c1d89sm1220597fac.13.2026.07.31.08.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 08:03:30 -0700 (PDT)
Message-ID: <20683d73-32fe-4605-93e4-b02da0172e2c@kernel.dk>
Date: Fri, 31 Jul 2026 09:03:29 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/9] io-uring/rw: Use accessor for hrtimer_sleeper
 ->task field
To: "Paul E. McKenney" <paulmck@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, io-uring@vger.kernel.org
References: <e76a426b-f65c-4357-b263-96506d877136@paulmck-laptop>
 <20260731004019.3530210-4-paulmck@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260731004019.3530210-4-paulmck@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/30/26 6:40 PM, Paul E. McKenney wrote:
> The hrtimer_sleeper structure's ->task field is used as a flag to indicate
> that the associated hrtimer has expired.  This means that the hrtimer
> handler can be storing to this field while other code is loading from it
> to check for expiry.  Note that additional races appear for hrtimers that
> can be restarted, which could be argued to be a user error.  However, that
> is no reason to let the compiler introduce additional confusion, and to
> this end, the hrtimer_sleeper_task_get() was introduced, use of which also
> has the benefit of avoiding open-code access to hrtimer_sleeper innards.
> 
> Therefore, apply this accessor to the io_hybrid_iopoll_delay() function.

Seems fine to me, but for some reason you didn't CC all the people on
the series. Hence I don't know if each can stand on its own. A quick
grep tells me that, no, that is not the case, as
hrtimer_sleeper_task_get() isn't a thing in the tree right now.

That's a slight nudge to please don't do partial CCs, it's impossible to
tell without needing to dig further.

-- 
Jens Axboe
