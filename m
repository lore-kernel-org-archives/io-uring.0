Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132459;
	b=1SwgbxVmS/7lpBMnN/myWp0w00pDE57tUno9/fsrOf00O/92R5m31DxtQlBsCKsQ7brA
	 aNLDfQvcxJwokVs6FNFgC3xsyWe7HUnL2DB18XlEJfqBww4XAuwOeeWb3+ZllEdKhcbmE
	 7qRvvk3glpbqpZLzbDV0fnxe2f2ghepgsqFk0WF6gNGflm+9rgPhMCwvzk7sHsUdn+FxV
	 uwB/HGj3sxRkIWgehYQT6u9uyfeZ+7deHwiRtn3l6RfNDlvRTEpa7Z1nEWzMlyT4wS6d9
	 nbma7Wo1r10aDFMkJpzFRgPctJXatUDfS0TSPyDu3yBsvm4CbIDrDsZJulK1QipnUQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132459;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=26g+N8mo2rBmqBHXrA7khaUCO5E0k4YWrjRohxbO/xk=;
	b=mw92EONJuOANtN9DTPIGXZa7EV8s8vLTHyExx7X56h9/UO5MjcY/GxBh89mGDCxo5ANP
	 gfk9qCAlUb79Zw6UyG7O62QlfONfArsufpq+37JGQh28JDFNoYrB8BmDLWg84Zcre0xme
	 CjJPJ/clU3nnV0Nou1RgMhVfenl/RnC9XytIJjZDq90rkx5iNqsX9YqEK2/AjxMc1FymI
	 A+hlETyMZT0LK8bDXB9ZQppkEcC3jbI2slz35xdDb3raJSWOo/DTdwPq8sim+qKE7dUhe
	 m/Z4eVXILCPT/+oQRjUkVGXvUN0BV9LbOj4Xxyt6bg4j7WLA+QT9cUO8iRE1z+IvyTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFzVLYTK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5BE606A337
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 23:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFzVLYTK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3381F000CA;
	Thu, 19 Nov 2026 23:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795132458;
	bh=26g+N8mo2rBmqBHXrA7khaUCO5E0k4YWrjRohxbO/xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UFzVLYTKt0XzB66QwTiNFBQpOLDodBsvPWoItWsiGbvwcytopSH/rbKeQMR10b+ej
	 +P38E8yEE4HK3BQry/00nRVHQJdjSPzBSx+V9DCWZqYYSNtjVIMiQIMR82hV2kT68O
	 0a20X7xNJ4d1N4wpJOc+4lZUPoRhMsivovOr9jLwWyMwk04tzKcfNeoSWfXh1ZQuwr
	 qqFOTKxOGC89RjBbBK4d+fREXF4EYIXo1IXiyfIasFFzRFxWlA7aw+youOgjQDOHk4
	 CO0xbqWTI7FfhvuxryFtvS2yQ+mR3nc4OmZRjJOU7bE/b3mDNKk/ce/S2Oq3dXdsNn
	 hSXIAAPeVgdjQ==
From: Sasha Levin <sashal@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	cve@kernel.org,
	"io-uring@vger.kernel.org" <io-uring@vger.kernel.org>
Subject: Re: proposed io_uring CVEs for 7.3.2
Date: Thu, 19 Nov 2026 18:54:16 -0500
Message-ID: <20261119235416.1681888-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <fb339d39-d4f9-42ef-80b5-fab7398d2774@kernel.dk>
References: <oMhla8VwCWoihfrmgn8znIy60W1QXI8g_v2OyB9i6sWESIDlVJlwoGGOLylJgIHRARNoieXUVRGqzeB__KvHMdXgnCfPPovs8vLMOzaMPEw=@rebasedinc.com> <draft-agent5-0001-re-eventfd-signal@kernel.org> <5d92861f-9a4d-4810-8700-b9e457ed9c86@kernel.dk> <2026111605-deskbound-clobber-a4a1@gregkh> <07947062-2974-4630-90db-1556e25b50bb@kernel.dk> <2026111722-unfocused-ride-065c@gregkh> <2026111949-tinker-symptom-4279@gregkh> <2026111918-entangled-juncture-4adc@gregkh> <fb339d39-d4f9-42ef-80b5-fab7398d2774@kernel.dk>
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

On Thu, Nov 19, 2026 at 10:40:24AM -0700, Jens Axboe wrote:
>>   f013b6955064 io_uring/sqpoll: do the return-to-userspace work in the SQPOLL thread
>
>Reject, it just runs limits later than it should, they are still honored.

Agreed, this one makes sense to reject.

--
Thanks,
Sasha
