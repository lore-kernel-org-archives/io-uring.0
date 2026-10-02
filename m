Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2D82D0C92
	for <io-uring@vger.kernel.org>; Fri,  2 Oct 2026 14:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952954; cv=none; b=udeUP4YReFb2uBgdKYCr1Lu6dj52x1ePGqqNwB3qiqM+J4xLDNCqTu41aC/rhrNe+EWGli8g+CTTwwHZIEcrgqFVPeUCLGAhSXE8pDCN6Yw7ZHRaWFb+bH6I7pYSeUNQxo/19ZWtvR0ZBBkUrZFg8Ct5lYhSbI1XLUXWLIjlN6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952954; c=relaxed/simple;
	bh=mWawWoT/4zGtCooTZRrFjQzDVEsQ87rz1F1yEWua8Jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyYphG5GtpzbJTKOXbUNHwaTTWFw8129n+uX4nMVhq31zIO8blED28iuRZFKvsJAL2HB8NNuPVzNSfSOLul9AWg+ebAfaZ4t1+OWY1ytaqhFeLr5k4xFbUAYMssK/essDyagymne8QGv/A7+Y830GPVVa8qVDEaLEo6167B1XV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=WIcj47sU; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="WIcj47sU"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49df0f3a690so749210fac.3
        for <io-uring@vger.kernel.org>; Fri, 02 Oct 2026 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790952951; x=1791557751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aS1nFHs1o26b9G5lmQi2V+h1cf11SB88eiBbPfTjO4=;
        b=WIcj47sUpRFBtqjA0GLnqxuCUFXZM9zyHz5gg4gBKWQx6HMuiZ8lRfhKIY5HE+sUxw
         RpzuxqokkIjOVEwQHyhZuDe1L1h3wvnOH4kwi9sJKMQ3sscQhA17KGS44KU1BvOxwmEy
         npKm3GOYK8Q5K9UC9C08WBbCqLi0bnZKYG1dVyKcFpruoSnNhfoMyX0o4fZcyTzpUHUa
         adcU3ZG6vU4pclmuuG2KHBidl33DCRFxIQ+wQQPXr4lMNI65bVyn9U2fdGIEtg5GjXu2
         /mxjwVwp2qBKTIsPlp4kDQ0ktwYC6DxO1Q7o6az586tuKp1kmv0KruFNwtEdPnq+op93
         kTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952951; x=1791557751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aS1nFHs1o26b9G5lmQi2V+h1cf11SB88eiBbPfTjO4=;
        b=0PL8Y6dxtUmB+4RvJrzlF3Uj5JcLX7lzfwlmSSfwvaBLJNsvPGwh436vY/zwjMGkob
         3h+y+bY7N1+G3fDvMCTsDqNVFPd/an0LBJs2+aTousdMy+u4KOf5cRZls51yJUQhbVFm
         9y/cj/eArCT7tmWjhrsOqmOW/W4X4shgzohMjZ4U6tSkwmXMBafUD+RAJ21sj5tpRYS5
         NbDJDS2y6+pZoSiBrOGVJgnumsD7LXBONlNvYVchP4XMWZTQbdvHQSstcT60cTJZ9uor
         EWc6dmBV/Z5qOceRz4iYMKGzyqXImN9Ug59LHmflIoOre5BB4Aqxdehd71ekI9pTlMxr
         tSsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfIz5BUeRDnkAo1bNfya7x6YoxG6riPXTxgv2H9dKSGVbVEaZYa85uhVWUZxDO2U775g2RKO0GNQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lPYwyy4qfekiGlgLjuD8qzNgHLvn2NziuY8IF+Kpu0TDbF4IDm
	cBS3ofCX1KX7EzKmnfc/m6I0HEl3mzx4v3NXV7J7V2V8DhocSriiK0V0HQHEEyDrNHM=
X-Gm-Gg: AYBFou1xYE+NNQJKWmYob0cG+fOMc6tnyKtfzvj006BhdJQ5TPpTfd/qO3G6+H4SfTU
	7MlogQyJObij7BBkb4RthEBGsC/CAD4nBSzrQqKF/lEeAExDMvf3jUvFh2FqNduROUdS7v2F5Og
	jeHcnVuNoQdU66zW33j6d+VvSB8tD1pK3BKLlJQBWK5DHMGanp5VBRRduZDZMIW6ssvTwKKNPoM
	a9hX+nDhuqHNI66cCp1aW5hHlkhNdJ5gm+EUv6ATJe335HvmQf0a7YmLvCOHwBIrKsF1GCDhV7/
	Xs50FzT4//MCkffsraYh3YMlRVGzPnQGH7MRMfNFFtgAnAl1mxtFQelf9Elcy+YBGicK5vr+/20
	IcLjXYvxx3KnvNSu+86qC1wGFtSTjd0GxCWP+4svuWjxXqVz9nmoQiaglMXwP7vlTtzgXNQf4Ip
	SqUVG5LnE5REVd0BmksUfoxM1iYSBRn2ilx+Yx/lvZ8yQXjpz/imdRyNkgx6VrGLb1DHeYYykTT
	+RsfgiW1cuMuBzRKk9orkOs+AoNDDcrU/jLsjKsl6lzm7xqFirc6Fg=
X-Received: by 2002:a05:6808:1828:b0:4f3:68d6:f12c with SMTP id 5614622812f47-4f528de5ecfmr2380933b6e.24.1790952950725;
        Fri, 02 Oct 2026 07:55:50 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f5243d47absm1998187b6e.8.2026.10.02.07.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 07:55:50 -0700 (PDT)
Message-ID: <ff775d61-d0fc-4ce7-a3a2-91789570ce45@kernel.dk>
Date: Fri, 2 Oct 2026 08:55:49 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: fix out-of-bounds bvec access in
 io_vec_fill_kern_bvec
To: Ming Lei <tom.leiming@gmail.com>, =?UTF-8?Q?=C3=96mer_Mete_Kaya?=
 <omermetekaya0@gmail.com>
Cc: Gabriel Krisman Bertazi <gabriel@krisman.be>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261001143003.755790-1-omermetekaya0@gmail.com>
 <87se2pwhzh.fsf@mailhost.krisman.be>
 <20874bd2-f827-4ef8-9855-dc8aaec874fa@gmail.com>
 <CACVXFVMrjhACs9mQMkJJxYXsTyh=a1ZHUmg1i9hK2+TZdwbXFQ@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CACVXFVMrjhACs9mQMkJJxYXsTyh=a1ZHUmg1i9hK2+TZdwbXFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/26 12:04 AM, Ming Lei wrote:
> On Thu, Oct 1, 2026 at 2:55?PM ?mer Mete Kaya <omermetekaya0@gmail.com> wrote:
>>
>>
>>
>> On 10/1/26 18:36, Gabriel Krisman Bertazi wrote:
>>> ?mer Mete Kaya <omermetekaya0@gmail.com> writes:
>>>
>>>> for_each_mp_bvec() dereferences src_bvec[bi_idx] in the loop condition
>>>> before the body is entered, with no guard against bi_idx reaching
>>>> imu->nr_bvecs. iov_kern_bvec_size() stops iterating when i reaches
>>>> imu->nr_bvecs even if bi_size is still non-zero, so the fill loop can
>>>> walk past the end of the bvec array and overrun res_bvec[].
>>>>
>>>> Open-code the loop with an explicit bi_idx < imu->nr_bvecs check before
>>>> the dereference, matching the termination condition in
>>>> iov_kern_bvec_size().
>>>
>>> Do you have a reproducer?  This should be checked in iov_kern_bvec_size.
>>> We make sure it doesn't go through imu->len which should match bv_len,
>>> IIUC.
>>
>> Yes I checked more and looks like the *bug* is unreachable via existing
>> in-tree callers.>>
>>>> Fixes: 1045afae4b88 ("io_uring: support vectored kernel fixed buffer")
>>
>> It doesnt fix something broken actually, more like a defensive refactoring.
>>
>>>> Signed-off-by: ?mer Mete Kaya <omermetekaya0@gmail.com>
>>>> ---
>>>>  io_uring/rsrc.c | 7 ++++++-
>>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
>>>> index 51b46e624..3d29a0c7b 100644
>>>> --- a/io_uring/rsrc.c
>>>> +++ b/io_uring/rsrc.c
>>>> @@ -1614,8 +1614,13 @@ static int io_vec_fill_kern_bvec(int ddir, struct iov_iter *iter,
>>>>              struct bio_vec bv;
>>>>
>>>>              bvec_iter_advance(src_bvec, &bi, offset);
>>>> -            for_each_mp_bvec(bv, src_bvec, bi, bi)
>>>> +            while (bi.bi_size) {
>>>
>>> bi.bi_size is the first condition of for_each_mp_bvec.  Do you really
>>> need an open coded loop?  If there is an issue, can we just add the
>>> check below?
>>
>> mp_bvec_iter_bvec() is called in the for-loop condition not the body:
>>
>>     for (iter = (start);
>>         (iter).bi_size &&
>>             ((bvl = mp_bvec_iter_bvec((bio_vec), (iter))), 1); <-***
>>         bvec_iter_advance_single(...))
>>
>> src_bvec[bi_idx] is dereferenced before the loop body is entered.
>> A check inside the body executes after the out-of-bounds read has
>> already occurred. The open-coded loop is the way to check bi_idx
>> before the dereference. The question is "should the kernel be defensive
>> itself or trust the callers?". If you find these kinds of defensive
>> controls unnecessary, happy to withdraw the patch instead of releasing v2.
> 
> bio/bvec iterator is written in this way from begining.
> 
> So it looks you should work on improving the iterator helper, instead
> of open code for the single user only.

Indeed, it's a generic helper. If there's a potential issue in that
helper, then that is where the fix should go - not having users
open-code the iteration.

So please take a look at the root cause instead, I'll ignore this patch.

-- 
Jens Axboe
