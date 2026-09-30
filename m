Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8324F30D1
	for <io-uring@vger.kernel.org>; Wed, 30 Sep 2026 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778264; cv=none; b=nj5ID87U4fwUvASrSdoQSVnkWEUTX4/ePsdDNyWKxjqV+FV+JAWtRQ9cFWHUL85sLQSxUrKpFc3tEAlr5nns78W4Fguly/oSnuBJg4Z0bzk/bu4AGWATRHdP8dLbLTCO7oEOMzMHz9okwwm0MzxL31o1HHcmdZLbajvWHP/fi+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778264; c=relaxed/simple;
	bh=IYJIMNtdJcCr4u6cOiHPBOmN0vaj7VFV7Qc18iDIhTc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=UeJkloUZO6sPAAOrWUKN1b9yWuzHiUFYRtEmG3YrZBxPNWgv7jEqB0kCVgkFlDRTTEfgg0uZr/FqKdG5V9eOQqAgSmbqHylMlLHrysExCJj3qgx7/bpG/jJzo8MSOjH4T7OhymNSVlaiDEIkmaq7PM5iAXN3yaNVhPUJIeL9vSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gctlW0aB; arc=none smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gctlW0aB"
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-6768036283dso654578d50.0
        for <io-uring@vger.kernel.org>; Wed, 30 Sep 2026 07:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790778253; x=1791383053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VSBcqx9koa8CG47lz1u32c2OePWRmcPOrAz/9TDxhs4=;
        b=gctlW0aBm4DLTLgSxnEHcWgiUl429uuP6GkZ1zsXBUrorWGOk3IvMZLNoWLUCTmPe5
         EHoxCT7Gri9p/hMd2O2WXit4LgM3E+bUJ3JiYNvuuZFKqG7DK6FwGLDP7kYhfGt85E4k
         R7Fifqx9zWevLeyGv63jc6PR399/An8qleoVSrkdWAbaLwvsGjkiQaJG7i8V11GCzBED
         9+LYHmDQEa3gbrg7mOohtHu+GgvzP1h6flB/0DTxyi4lVT9Ya0EETjTac7XbE7wjf/QV
         zWds7vuSOafFahbeolJxAJMChIvxkMayHd8RJ2l6X7YyGY8p9WArV03uZy648Kr73aev
         jiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778253; x=1791383053;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSBcqx9koa8CG47lz1u32c2OePWRmcPOrAz/9TDxhs4=;
        b=h+dpfXO7/IV0n8jzaSPLk2UZay0j4QOcXIS58j3IoxKo9mBA+39hbOmuWzDv2Og/y4
         arf4zaWEMhyzIQSC6omkDnPVi74S/ssAmue7N+caUNcWZ2jTntZBFvk75oMe9M/PPo+r
         XwYwr2sUgj1m/ELfavHYB9Z0aWQ+fyb8smkHDb7xJZUwsGUMAkfjKZ3mJCpYQ0lg7ifI
         DMb7I4vefgS/qaU+qS9Nhz5tMQ+fadpxqphQ8X0o7lJDSMb2jtj3jbVBLRd61pJ4ntSY
         ulQxuxRz+PCLzg6CBi6E4OAPTr9kNVduQCH+jFkiT7dLcgEroNnQ5z5UTfirrhESHi7w
         n4Rw==
X-Forwarded-Encrypted: i=1; AKwUvBwT9VGdFwEfD5Yni2r/uKSXoyVodvR+ZLXZi0eZH096tYq+aNIANYDd8+bt9qkmZ3RH3rIybGXokQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLKOYMsaTH8DXaYmFTzC2+IbPfA0UFliVH0dWZtAffbL6IIurER
	+YgfBc09ntMir9qxFeGZ79indViSiNxKm1K33KGKoBevcVYA6uscDGP5
X-Gm-Gg: AYBFou1TwLHvR5QXptx0VK9MdW6/hctTwNSRPvoAzMNQPPC58f/RlHPGvd5Ig5kEQ7R
	gleUmecttzbVlFdBpMT8hN2o0MNaWW/e3WvmYY3I/boEpqxARdhCdnvLNuQtTGQKhs4Os+uQf/k
	AvsYOWzSoqgENyxZrqX4TWObedJsdkBB035wuW0kiC8AgCQP9rLSePrPU/AOyLCetadF1POMMYq
	c7jjVn22W1lHBzwu7XyJ+iMVwEmL7aqOoCT4whoOPFqIutxxRIPO8EkLrLRZTEhwwQxGJFoGeKp
	ZIyFjOrhHfpAAgQCfHqbSgzxS6HJEqOaqk4jTXcG0Gsi5XGNXo0JZTjEDIJ69fCc0oVBBslo1YJ
	HbaQvj1cevcs4TbrkbdxiWMExX7teKa/Jjj857KZYC+hPMNmUpmSQQKSUMeOShycZxrgTCqGE1j
	uvdauMx6Ru/5K78glOu1l1U2onpo77kTdsHygZGpK/QWrBtaAWuuVLMq3ZT1p4YPII0waHXegSS
	HWfgJEup7IFV7I6KB3lC/fi6Xt+5hlpYVP5eIOMPsl60CxT4B5N
X-Received: by 2002:a53:d014:0:b0:66f:c1bc:880c with SMTP id 956f58d0204a3-6768349e783mr477179d50.101.1790778253013;
        Wed, 30 Sep 2026 07:24:13 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6768152d0a8sm719338d50.14.2026.09.30.07.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:24:12 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:24:11 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: lollipopkit <a@lolli.tech>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, 
 Pavel Begunkov <asml.silence@gmail.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 io-uring@vger.kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Message-ID: <willemdebruijn.kernel.276ffa719c8ac@gmail.com>
In-Reply-To: <20260929153426.90278d054c98-a@lolli.tech>
References: <20260929045433.59435-1-a@lolli.tech>
 <willemdebruijn.kernel.570e0a646f4@gmail.com>
 <20260929153426.90278d054c98-a@lolli.tech>
Subject: Re: [PATCH] io_uring/cmd_net: drop unextractable TX_TIMESTAMP skbs
 instead of requeueing
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

lollipopkit wrote:
> On Tue, 29 Sep 2026 11:06:26 -0400, Willem de Bruijn wrote:
> > lollipopkit wrote:
> >> Assisted-by: Claude:claude-opus-5-5
> >> Signed-off-by: lollipopkit <a@lolli.tech>
> >
> > Is this a real name?
> >
> > https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
> >
> > "a known identity (sorry, no anonymous contributions.)"
> 
> It is not my legal name. It is the handle I have used publicly for
> years, including on GitHub (https://github.com/lollipopkit), and it is
> the identity I sign all my kernel work with. My understanding is that
> this is what d4563201f33a ("Documentation: simplify and clarify DCO
> contribution example language") intended by "known identity".
> The earlier CQ-full fix (3a3d93070c5e) went in under the same name.
> 
> If that is not sufficient for this tree, let me know what you need.

The commit you mention did remove the explicit reference to pseudonyms.

I don't know whether a github handle counts as "something we could check
back with" or where exactly the line gets drawn.

If anything, this does seem an outlier compared to other sign offs.
