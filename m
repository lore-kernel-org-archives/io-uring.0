Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643254;
	b=qzdUjZbyBndASRnMiMfqu7Ap+UAfGD6Su0paXVLy6QDrDGhvbMRsXZbpIcyuO6qO5/Wh
	 zk08sW/lp6T2vbbTq6/5dTIXsrfHLaIlCfHsmPuAf/+MdVBz4PnKHaP9QRHMZIiVHAtsS
	 CIEzpwH098yJb923lBw4C1VaqfuGgji1nMCz1fI96XbIg6qQCYf+UR4GPo/iAEG5xvtGs
	 2yG7MCSaVYNT/wk6sMYq52DQzZEPaCIe0QQ0Abc46pd2caLFcyHOEHx00n2AB3J8gYZ1k
	 xu0KWK/Yf2GLjYbXpYWdXzMxXEjIqwQ9OgzNbv8NNeZOADHlkhAhA9cKDHKiYZ3+nhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qYtfSV7pXPeTfIc4mFEoIenAEwjJso8HErV9eJ0iS/Q=;
	b=cgpt/28ZQ/88gUIJnJimvTEcj1GlAeEjTYPHBIAbVy3TWW/CzO5ntlGR3c0vFtjKhtWC
	 aBRrpLmnPhYrM44H0JR2RB/cpxd2f7DHqpotBtu1pkN+UNawbDl5y0l+wUc2jysFcohnG
	 6DI6J5vYVpc2PPfyswk7YX9TYclM+slcrOpLGcjPfwzm8KHO4a3ASKV78EZtmlLVjw3P0
	 jgv9XohcKGC7gciVGsXtjtmjmchj0jl6bGrTrj8+Jvdmzog90p+xtEnX7yIFLpeevNOaC
	 7MJ/552lNdOe+mMcXfK4T2A8jbxiNOyTi9oONPgG3qCp+sLAk+t4+j5wTRIPciCB4sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=QhSgR6jf;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58996606A323
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 21:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58996606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=QhSgR6jf
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386cf1041cdso2289765eec.0
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 13:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795643252; x=1796248052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYtfSV7pXPeTfIc4mFEoIenAEwjJso8HErV9eJ0iS/Q=;
        b=QhSgR6jfKHc4KQuRrW28/UnwFauHpcwusBDSzItvH11mJAYX4ilqK4kQPo+RGc9P+b
         l7TQW9X/6+DH/ct2BvVRqHhNI2pprR63/itI1TTWOhIIy6TotVfu8p2lhIbMj3sBZKj7
         pwvgBfaST27s7N1+aFKIOI2ichwtiGqkAFOjaBMOG+qACgbMDTvc2zj0k+RQ1+Sc7jyj
         ZTSgpq7HTWLZqO80lFZq1uobzVzGYUScIwuS8KIqxy4lLTCMHsns02qz2o+c0LElwZF9
         vmuiXwHNSWK9y74b18KXGcCZOFqNq/Zuil/IuBnMrQhP5SM2HJ6Cw9lBKA3YEiA3v2do
         zfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643252; x=1796248052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYtfSV7pXPeTfIc4mFEoIenAEwjJso8HErV9eJ0iS/Q=;
        b=BM98lHRB0coRfT93VdmUT006J3KXsinxOmaKBFmrb1sVf9y6tXcitQ3bA7Fe8mkB2Y
         hw3/UKoaXehV4QcWf1E2m/XVIbVpfC0U4w8T/4Ijt9AgE7af/Ct2x/19vPlmv2fH78lG
         t9mmu5OK2/vFLdQnGKW84nhb6XfsI68stoCS7awIkSedrul6VjkIbYwKZ4r96IMUbVAd
         nhkPFccXBvz/CXG4EgvltXtlT1pbVu6iL0/8vqEOLqcfw2W6zIUMmfGFfaYrjMNrvaR8
         42HR+3d4lU5F/3+QtMiNXTvE57eFlq05V655fGbICU0ZP/VCVVKpaMOtBrHu7p7o+3Vf
         V6jQ==
X-Forwarded-Encrypted: i=1; AL+hErHMd30AWk+ySkVJZTrE0X4deSrcjK1E6UBRP5AAtyffAAQuQ37NkBhZlJPMjJHxADfIqI+ah4gG8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/dAoVXGHDLWbueoQ5da4ste2vWwaH/PY0M5+nrsqtGOQdz9p/l
	2Uqx1mo6IQC0wbj5tYMd/Sor1+rX130bY6SIb0EClNF4jPWGROqD8xR/1cQ0xmmQ2ok=
X-Gm-Gg: AZFdTZedtA+VPPG6bZG3lGv9B7kyVCc8JGI3wgYw/Md6yNS0ncCIMjW5VdMVsQWJGaY
	Qcagjhtx+EkgO9uW6sIHnTFTUuNWcaTfs0b8H4JCk7G6ry7xKSaTSrV6aHRxq7/hohOHw6ck0lu
	9zGrbqQPG3Jqr1Bc1S0/b0ZB2mm09sPyWFF9j1MznzmwO0u1ZTaK1Z7LY57gi5OeAZLW5o04jt8
	cpmk6aNduw2+Fw/MYNbWhUPrKuQhIcJTefC+M9NtMTX6GqeDR0TUh23LqIn4MOLLPm1wshBpMBw
	7waLH9GajeXkgG97KskakQmhowTBOuYOphWskkeUAXMGqSfncrG9zj9J3meQzUOFNGsvAhFlDec
	zJ6jcR+iIrdUYWXUwabTMbiiAj1EjOQzrYrQ2tM89AjkSUTvy+AhrKFeHvmx+ZlBc9gJd5KxJrU
	9tsYrSPUKeEXEPJZGhCJVin8svMqBTPzCXdRE31Z8iUddfAriGmw+TtaPeJaU33z5o0YgLahzQ1
	53WGydBYt1LqKS1SQJDUVJaaTAKlNrXJ3SnEuFPjc2BS0W5k9H6MhBPHtqNAUAv7XlXqis7r756
	2OlOjQ20RHDHyaOBbGdyxlHRx5nznD/XVhzGxVpQLcd5gDGmSSiYf5+DUwmVxmSaK7OGwYDix58
	UGzM1z29imGprmhSK/gW1BgUQv7S8cL2/viaiCwbnirsgh6t1
X-Received: by 2002:a05:7300:c001:20b0:386:d2a2:135b with SMTP id 5a478bee46e88-386d2a213e1mr2605327eec.39.1795643252198;
        Wed, 25 Nov 2026 13:47:32 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm100644292eec.3.2026.11.25.13.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 13:47:31 -0800 (PST)
Message-ID: <86fea5ad-43d5-46d6-b2e5-f93b8a6afb8f@kernel.dk>
Date: Wed, 25 Nov 2026 14:47:30 -0700
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
Subject: Re: [PATCH] io_uring/openclose: allow an empty path with O_EMPTYPATH
To: Jori Koolstra <jkoolstra@xs4all.nl>, Hengyu Liang <hengyul@cs.unc.edu>
Cc: Christian Brauner <brauner@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>,
 io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261125180817.3682397-1-hengyul@cs.unc.edu>
 <170898867.2781789.1795642036410@kpc.webmail.kpnmail.nl>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <170898867.2781789.1795642036410@kpc.webmail.kpnmail.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 2:27 PM, Jori Koolstra wrote:
> 
>> Op 25-11-2026 19:08 CET schreef Hengyu Liang <hengyul@cs.unc.edu>:
>>
>>  
>> Commit 31cf44efa6df ("vfs: add O_EMPTYPATH to openat(2)/openat2(2)")
>> made build_open_flags() accept O_EMPTYPATH and turn it into
>> LOOKUP_EMPTY, so that openat(fd, "", O_EMPTYPATH) reopens the file
>> behind fd.
>>
>> However, io_uring also uses build_open_flags(), but __io_openat_prep()
>> still copies the name with delayed_getname(), which rejects an empty
>> name with -ENOENT. As of now, IORING_OP_OPENAT and IORING_OP_OPENAT2
>> accept O_EMPTYPATH, but fail on the empty path this flag is meant for.
>>
> 
> I think you should leave the reproducer from the commit message.
> 
>> The issue can be reproduced with this program:
>>
>>     #define _GNU_SOURCE
>>     #include <fcntl.h>
>>     #include <liburing.h>
>>     #include <stdio.h>
>>
>>     #ifndef O_EMPTYPATH
>>     #define O_EMPTYPATH (1 << 26)
>>     #endif
>>
>>     int main(void)
>>     {
>>             struct io_uring ring;
>>             struct io_uring_sqe *sqe;
>>             struct io_uring_cqe *cqe;
>>             int fd = open("/etc/passwd", O_PATH);
>>
>>             printf("openat: %d\n", openat(fd, "", O_RDONLY | O_EMPTYPATH));
>>
>>             io_uring_queue_init(1, &ring, 0);
>>             sqe = io_uring_get_sqe(&ring);
>>             io_uring_prep_openat(sqe, fd, "", O_RDONLY | O_EMPTYPATH, 0);
>>             io_uring_submit_and_wait(&ring, 1);
>>             io_uring_peek_cqe(&ring, &cqe);
>>             printf("IORING_OP_OPENAT: %d\n", cqe->res);
>>             return 0;
>>     }
>>
>> Before that commit (v7.1), both calls fail: it prints "openat: -1" and
>> "IORING_OP_OPENAT: -2". After that commit (v7.2), the result is:
>>
>>     openat: 4
>>     IORING_OP_OPENAT: -2
>>
>> This patch will copy the name with delayed_getname_uflags() and
>> AT_EMPTY_PATH when O_EMPTYPATH is set, as io_uring's statx already does
>> for AT_EMPTY_PATH.
> 
> It ain't a sin, but try to avoid "this patch" references.
> 
>>
>> Fixes: 31cf44efa6df ("vfs: add O_EMPTYPATH to openat(2)/openat2(2)")
>> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
>> ---
>> I found this while comparing the behavior of different kernel versions.
>> I used an LLM to analyze the problem and to draft the patch and this
>> message, and I analyzed the result myself.
>>
>> Tested on io_uring-7.4 (0659e44ce739) with KASAN and lockdep. A test
>> that runs 24 cases through IORING_OP_OPENAT/OPENAT2 and through
>> openat(2)/openat2(2) now gets the same result from both (32 of 42
>> results differed before). The cases include O_PATH and regular fds,
>> AT_FDCWD, forced async opens, RESOLVE_CACHED, a direct descriptor slot,
>> a bad pointer and an unprivileged reopen of a 0600 file (EACCES). The
>> liburing open tests and the openat2 selftests pass on both kernels.
>>
>>  io_uring/openclose.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/io_uring/openclose.c b/io_uring/openclose.c
>> index 24cf3ce2e2bc..29fe31f16a2b 100644
>> --- a/io_uring/openclose.c
>> +++ b/io_uring/openclose.c
>> @@ -54,6 +54,7 @@ static int __io_openat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe
>>  {
>>  	struct io_open *open = io_kiocb_to_cmd(req, struct io_open);
>>  	const char __user *fname;
>> +	int uflags = 0;
>>  	int ret;
>>  
>>  	if (unlikely(sqe->buf_index))
>> @@ -67,7 +68,9 @@ static int __io_openat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe
>>  
>>  	open->dfd = READ_ONCE(sqe->fd);
>>  	fname = u64_to_user_ptr(READ_ONCE(sqe->addr));
>> -	ret = delayed_getname(&open->filename, fname);
>> +	if (open->how.flags & O_EMPTYPATH)
>> +		uflags = AT_EMPTY_PATH;
>> +	ret = delayed_getname_uflags(&open->filename, fname, uflags);
>>  	if (unlikely(ret))
>>  		return ret;
>>  	req->flags |= REQ_F_NEED_CLEANUP;
>>
>> base-commit: 0659e44ce739ecd856164c75a5325b7959a2921d
>> -- 
>> 2.53.0
> 
> Reviewed-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
> 
> @Jens - You've pulled this already, I don't know if io_uring appreciates reviews
> after pull. Let me know if not.

Always appreciate that, the link is in the commit too so it'll be
discoverable after the fact as well.

-- 
Jens Axboe
