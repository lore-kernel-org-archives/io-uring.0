Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132539;
	b=S1LE3BREtOvT8EuqGuCm6J3xIY+SlKLtNG07yoD/bfFpIgz9/GK9ogg42+VAWB/E0EHz
	 plhhe8cmWxquRPM3EHvpBgar+Xq78rOIvAadgDaQctG+eC2yJxBUJtCPVdickqzotbTrH
	 z4kI4yaNncJFDKYvIEyc76AIfkQLpqezkUafLH+szAqxy5DGyKwPVAR6blnnBegIRrs8C
	 XyKkcnJs6wOaNwzDjcKdkK2TgKaWUELNM4G95ZQT2TOxKsfekiAR8xqnxMorE6/Bp9Jou
	 kvelyqJCIstb4j3Ew1Khlbpql1eC58Z6xXtZzmMKTl/2RLiIdmi5bAOoUX2M97+rGkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132539;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=tjPp+2yMDMs/IeoQWZwmrKMLCWQcIgcTpvDEjAJ8Aao=;
	b=sdzcZWmNeEIyiJpszfs4ZBYWSYbJjPmsedz6Rr6nQa/2yY2X+vG6DAC6/h/zAD9ZxCzN
	 RjYB7tFObq/vsQYWG+/6P65yyEf8vTr/nRyfcMkwM/RmQgPBkBO2OLlarPo7fYvpGecsI
	 rUeha3AY+T6wgdON5yfFMxIGuX3UxcSQl7mTqvf2rk9r4SnSBzoCgjBx3Tf5q7XCMtbQW
	 /YUhQEEKnHfZxMWWZBSOrkZoP6i0+osU7jC8HtH6HVmnI4R9KqkjAzH2IXPUdu/yUbdab
	 WL7zQxZ1qkk07KkNIDhBn+KTy9d1o69eqS0FnYq7b2yLYlrdevtWIGBvPZkqaRgQ4xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ooeA7sUz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44DB606A320
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 23:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ooeA7sUz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8BC1F000C4;
	Thu, 19 Nov 2026 23:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795132539;
	bh=tjPp+2yMDMs/IeoQWZwmrKMLCWQcIgcTpvDEjAJ8Aao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ooeA7sUzW/vnKQx2VMm12sVqRbvAMp9jo6MFH18d/z4RrZ5av+Nu+GGuszHGJV7gn
	 ics/HToJ2qtNPw0gekP6he34+sHGO6MRQkoUXuYE2ccYcsT51pft1t/L1D5BxBW3re
	 xcsrnU1LsC1+Q9fR1LccA98RYXal5UlhX+w/Mgvt/RIiq4Y0y7QrQvslrtcLX7mUZd
	 6pc7mjS7g/73vMhB6TezZ3BiTPdAinlsatYGUKMcSRqgwyeNdgGa1hfBgGyg38Gj21
	 1W73Ygt2ThDN+EBxeqh4zNzeoU0KlkYxUEusT0Db9eh4btcN63sP+FefEsZtUsQ4XL
	 oKMH/QzU0dbyw==
From: Sasha Levin <sashal@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	cve@kernel.org,
	"io-uring@vger.kernel.org" <io-uring@vger.kernel.org>
Subject: Re: proposed io_uring CVEs for 7.3.2
Date: Thu, 19 Nov 2026 18:55:37 -0500
Message-ID: <20261119235537.1684133-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <535342d8-604f-45dd-968a-0fac8223acbc@kernel.dk>
References: <oMhla8VwCWoihfrmgn8znIy60W1QXI8g_v2OyB9i6sWESIDlVJlwoGGOLylJgIHRARNoieXUVRGqzeB__KvHMdXgnCfPPovs8vLMOzaMPEw=@rebasedinc.com> <draft-agent5-0001-re-eventfd-signal@kernel.org> <5d92861f-9a4d-4810-8700-b9e457ed9c86@kernel.dk> <2026111605-deskbound-clobber-a4a1@gregkh> <07947062-2974-4630-90db-1556e25b50bb@kernel.dk> <2026111722-unfocused-ride-065c@gregkh> <2026111949-tinker-symptom-4279@gregkh> <535342d8-604f-45dd-968a-0fac8223acbc@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

I agree with most of the other assessments you made. I'll try to improve the
review process on my end to address those.

The one outlier:

On Thu, Nov 19, 2026 at 10:39:40AM -0700, Jens Axboe wrote:
>>   0b34e7b20a48 io_uring: charge tctx nodes and personalities
>
>Doubtful, unless we're strict on memcg violations are a CVE, as I'm
>sure there are tons of ways to do that right now in a bunch of
>kernel code.

We are. We might have plenty of those, yes, but it falls under the definition
of vulnerability that cve.org has.

We've assigned these before when an unprivileged user can pin kernel
memory outside of memcg, e.g. CVE-2026-43287 for drm property blobs and
CVE-2026-90099 for tc filters. Here every thread gets an uncharged entry per
ring it has used, and the changelog example has 642 threads on 4000 rings
holding 2.3GB with 59MB charged against a 64MB memory.max.

>>   075d5837bafc io_uring/rsrc: charge buffer arrays and nodes to memcg
>
>Same as above.

Same as above :)

The other ones do make sense to reject.

--
Thanks,
Sasha
