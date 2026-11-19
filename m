Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111807;
	b=yJOUQ9tvo1T+yvtFZvcWbmoO0lo777pQhyRF0C6QjCtuz67l6Q18w/jvHM0C7zzOymSa
	 /EsnXTAqS8kqkYBGBZTlNqhGEz5DmTVfWq6ca6+4s72KCY9/aZeeDdyZkBLesf2vXt/So
	 2GeWDeN2AC2dHMSVpY64w2pRa3/kML1ZkXspcc0yD2zTk18j3TTGENwcT59zrQ41fza5z
	 E6mqd7kXvZfX4QimeCY/hsJJ6zq/9rOMwMZ47Z3FnBOtT2lRMOacfwFkRzpzP2frfyStb
	 pZVLDsm7w7z97Ge0dt2Y+fnPYEZmT5vt94Gpb1H8Pv0tR49pCRVcvefnJLrA2rFR0Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eAJwS5iN5r2K25IfwqPegf23Tvbob7aAcbmSXoNbXJY=;
	b=1zieusuyTJ3BuC2/EtTpikygJy8EgsI2i9vaiLFM3r+32upGHSZDxTdKbedJpCjt/ycv
	 EeqlxPZWIiZBJmIQTb0OF34FqBkkBQOXKS18jzwq98kVnTlelgIaco/GTfGblO5JYntPm
	 m2Hcl2SVOAW5lLPdA0yoNlIlLpiPmuAJAluoPLp1M8/oI/oxBbcT15Z6zxmqLU3T7ySZt
	 lDaQ6NdWqURipQatrff/PAn/mJMiDS+udi2pecD33JlmahoEybFrm33AJgLTaqXYH+/9v
	 9dMrZJsBVyE36O6Dd1j1dnE7gx+l6S1oIwSJgsw8hJwZ1YSGILRTjd0Q6/W8KC5ldhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DXJ483Iv;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4F4606A324
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 18:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E4F4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DXJ483Iv
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-48ed188ee81so60861fac.1
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795111805; x=1795716605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAJwS5iN5r2K25IfwqPegf23Tvbob7aAcbmSXoNbXJY=;
        b=DXJ483Iv/FThvFRAbT2ohhhHi3euGdiOGFyyIPTEjL6EFLQdohhbtC1hAkGksYWKr8
         buuVuIFtifcpfUx0t7jVPRAXhRkVlVr8kbefYHHChDg1CUQVI3dBE10DaBPJbAF2VyVh
         hHcQit+lJ3rYaZwOwH57fowaSuWG7hoYtJDgd7mw9AuTPi8h8oCUaAbptTMSWwMJyoJE
         WISphaPP0aq6Hki1VVX/TCzFTQA16X7f3u/oR/+MmgetFOdd9hTwNCxVtteO0zMCy8Bg
         C5+gYwI5PjLFyueK3OLW8MahfrcNMeXvhMv8xGs3MoDNU/B83Xc+u/0UrWfMKx3pzpFz
         F/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111805; x=1795716605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAJwS5iN5r2K25IfwqPegf23Tvbob7aAcbmSXoNbXJY=;
        b=NCl+aBN+Gb59hd9AWDV/9T+u5Pi+BVQhz9KDGNUGOE+u3grqP13uh2OoZ+e2t04VHt
         JtRcEJle8znu6WdsRcG5CmFzNbCFmA+l1YxGCT608UxtyENVoMLgdwQL0sU6S2u+QRIG
         UWRT4AfvBeSGK6jqGhmGj2q9BBvMIE1mI+iizIMOs9O647gCVf1C4uuduCZqTLs8Cvid
         8FeMe/5vYzrWfVPmIvG38NW14aVsTigifHeeAik9fVH+1zB0CEJoeN1UvpI5NPjKA3ia
         ZESFz8vzx/hONCYHEUI3hJDbJ4BaPgQYM0O3ESxj6cBVnwzkoQVxZyWd+xAOSbY9rlSu
         gWLQ==
X-Forwarded-Encrypted: i=1; AL+hErFo7VzcRujY1XOzsGRE5c4JbI9bI18bTIhCbcDpSmB7RSycYtbcJwDHJqQmaIb8KIvFSaGqvZxvtw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+hDAWPZPpUTRKTTE9mwOSusEkMTjocRmzEV9cdAanIEuDi/Z11
	uM6mgfs6wqoOsaYTuAMGu96DLORB1ZoetGlVt0qg86IXpxbjh2bCqhSmHBDwI660H5k=
X-Gm-Gg: AYBFou1Z+lncODiKBYGJcPFYdOb5zkCEVD8xAJNlBzz4aIrTlWWX4sDlo4dlJ3x6cck
	bXnYXiuuBGiERMeSUtVeZ+on6dacpVaTAVGISSALS2cj4uBy1StQxL9rGRU14v5efGXa9pt5Hhg
	hKmf/wt1LZlQ9HLelMjsNPCJsSvZHLiVUR/Cykf8xFCRZs2cc2LsbKdhWNCWcTO23yLnHhX0n1k
	My5G5s0ahz4kKr2qo9f6Z15S/kFidt9r6xnsl90/3Wv+d39S0EUouUQ6tbUlzBnDA2p2m7WpD+z
	e0dHxwFLf5JiWpkgG7cpEjBCL1OrDyRqNo3kmfNM78bKLxK5E/YEZvCg/oYMznOk69GKMHMinyQ
	out3GNQvJfgn3viEJGx+Xs+lVYHVF14uWk0gOiWPhAdTWG8COMNWgEVhptvI9a9PVGSd5E+65El
	yBLgiz/eLpgXHkUHdlKgtCmTejDxw7rTWLAJHSrk4Y6pDkuNV/RTKMGqtJQsW9L2lrQjybrew0Z
	OH3+VCZBHaPB2xC/pQRFf1AHOSXj39kLa2T3m6MmXJGbpmHIimXnMA+H31XTMm+psLkk6d2I5Qi
	bt8DKGy3V3jMkozOnw4gmXkll/UNz92UB0gKMiMhOXbk7uqoQiTUmUJosmJcH3UB0GSryfTJIqx
	+8+KSiPANq2TiU1/LgaEPzy2/LS7iwWiEr4qTMlNHUZNlhI1Dhb6Umu9Cf/0LRMJYhaAU
X-Received: by 2002:a05:6870:418e:b0:48f:e0f6:bd5c with SMTP id 586e51a60fabf-4bc862fd3e1mr335910fac.45.1795111805133;
        Thu, 19 Nov 2026 10:10:05 -0800 (PST)
Received: from [192.168.0.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5b07d766sm471574fac.2.2026.11.19.10.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 10:10:04 -0800 (PST)
Message-ID: <8e8bd832-ead2-4d77-9ca8-48274637d26e@kernel.dk>
Date: Thu, 19 Nov 2026 11:10:03 -0700
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
Subject: Re: io_uring/eventfd: registered eventfd signals only once after the
 cd305ee3633a backport (6.18.y, 6.12.y, Ubuntu 26.04)
To: Sasha Levin <sashal@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 Yufan Chen <yufan.chen@linux.dev>, dev@rebasedinc.com
References: <oMhla8VwCWoihfrmgn8znIy60W1QXI8g_v2OyB9i6sWESIDlVJlwoGGOLylJgIHRARNoieXUVRGqzeB__KvHMdXgnCfPPovs8vLMOzaMPEw=@rebasedinc.com>
 <draft-agent5-0001-re-eventfd-signal@kernel.org>
 <5d92861f-9a4d-4810-8700-b9e457ed9c86@kernel.dk>
 <2026111605-deskbound-clobber-a4a1@gregkh>
 <07947062-2974-4630-90db-1556e25b50bb@kernel.dk> <avxLtZ2YLHdbeZxC@laps>
 <8e6c1d69-9910-4c89-832a-34ecd65a0ca7@kernel.dk> <avxPlrd77WiXagvs@laps>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <avxPlrd77WiXagvs@laps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 5:59 AM, Sasha Levin wrote:
> On Tue, Nov 17, 2026 at 05:45:53AM -0700, Jens Axboe wrote:
>> On 11/17/26 5:42 AM, Sasha Levin wrote:
>>> On Mon, Nov 16, 2026 at 07:21:38PM -0700, Jens Axboe wrote:
>>>> On 11/16/26 2:52 AM, Greg Kroah-Hartman wrote:
>>>>> On Sat, Nov 14, 2026 at 11:12:40AM -0700, Jens Axboe wrote:
>>>>>> On 11/14/26 10:42 AM, Sasha Levin wrote:
>>>>>>> On 2026-11-13, dev@rebasedinc.com wrote:
>>>>>>>> If this is correct, a backport of 04fe9aeb4f3c to 6.18.y and 6.12.y looks like the right fix; it keeps the CVE-2026-80920 fix in place.
>>>>>>>
>>>>>>> Queued for 6.18 and 6.12, thanks.
>>>>>>
>>>>>> Yet another bs CVE - Greg, please invalidate this one too, it's NOT CVE material.
>>>>>> Getting a little tired of chasing these.
>>>>>
>>>>> Now rejected, sorry about that.
>>>>
>>>> Not sure how we improve on that, it's really annoying to catch these bogus
>>>> ones after the fact?
>>>
>>> Hi Jens,
>>>
>>> Since some of our reviews are LLM based, I was looking to see why this one was
>>> flagged as a security issue.
>>>
>>> From the explanation, and looking at the code, it seems that we can register an
>>> eventfd with io_uring, then have epoll watch that same eventfd. When something
>>> wakes the epoll, the kernel is holding epoll's wait-queue lock. That wakeup
>>> runs io_uring's poll handler, which signals the eventfd, but the eventfd is
>>> watched by the same epoll, so it tries to grab that same lock again on the same
>>> CPU. The CPU spins forever on a lock it already holds. One core is dead,
>>> followed by RCU stalls, machine wedges. Any unprivileged user with io_uring
>>> access can do it.
>>
>> I think you're looking at the parent of that, not the followup. Yes the
>> parent is a real fix, it's similar to the eventfd fix in mainline as well
>> for that exact issue.
> 
> If by followup you mean 04fe9aeb4f3c ("io_uring/eventfd: reset deferred signal
> state") then yes, I don't think it's security relevant, and it never had a CVE
> assigned.
> 
> cd305ee3633a ("io_uring: defer eventfd signaling when queued from a wakeup
> handler") is what had the CVE assigned to it, and what Greg rejected earlier.
> Should the rejection be reverted then?

Missed this - I agree with you, I was looking at the wrong commit. FWIW,
this is the same class as:

commit 398e3fa789aa5ffddc8689d8cbc7b31e1824130c
Author: Daehyeon Ko <4ncienth@gmail.com>
Date:   Thu Aug 13 22:38:43 2026 +0900

    aio: prevent eventfd/epoll recursion on poll

but nobody ever assigns CVEs there, apparently? So either both are bogus,
or neither of them are. At least the inconsistencies here are odd and
arbitrary. Since I got curious after having looked at this one which
are basically mirrors of each other, I took a peek at other aio changes
from this year. And they totally back that up - nobody looks at these,
and assigns CVE. Since no development is happening there, commits
touching it are either treewide stuff, or bug fixes. I see 6 bug fixes,
5 of which would fit the bill:

Commit: c03ce4173c7b
Date: Apr 13
Fix: Ring mapping inherited over fork
CVE-worthy? NULL deref in the kernel when the child faults on the ring
after the parent destroys it. Unprivileged. I'd say so, yet no CVE
assigned.

Commit: 3adf7ae18bf4
Date: Apr 18
Fix: Partial mremap of the ring
CVE-worthy? Yes. Same NULL deref, and io_destroy() can unmap unrelated
neighbouring mappings. Unprivileged. Again, no CVE assigned, should have
been.

Commit: 398e3fa789aa
Date: Aug 13
Fix: eventfd/epoll recursion on poll
CVE-worthy? Already mentioned above.

Commit: b44341e39d85
Date: Oct 22
Fix: Request count overflow in ioctx_alloc()
CVE-worthy? Not in my opinion.

Commit: d53b5aa5cfae
Date: Oct 29
Fix: Fault races ring truncation
CVE-worthy? Third route to the same NULL deref, via a killed io_destroy() in a
  task sharing the mm. "Any user can do that" per the commit. Should
have a CVE, yet once again none assigned.

Date: Oct 30
Fix: exit_aio() returns before complete()
CVE-worthy? Ehm write to a freed stack frame, as before unprivileged.
I'd certainly say so.

But apparently nobody looks at aio?!

-- 
Jens Axboe
