Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E36D2EA480;
	Thu,  9 Apr 2026 05:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775712468; cv=none; b=VsFnrhX6u+qvXJbA6FlWvpV/6U3hBIzakKfvzNziq9xtHlV07uhCimwerZDNZQ5SoYcsbRhjw3vVo8sA1AMABV93CCBQecHR1GzKwMRQe2FrnjcEVIs+5rHndqbG5fMzxVLY3sCKddBSj1Vkp+7Hv4+5bKrf3z5/6KOY2ods2lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775712468; c=relaxed/simple;
	bh=t+0BZmDU/zTjG+nTgW8T89jWjq/MUHoxQ1+xLpqaEhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyNBGJOaS1+T6vLhxzKxxMrLXBKPFwUNwJ9qZJZ/2qb1H5yc9NoNWHy3Ww9pkhMqbEYsC9bz8HE9CeR0bI6Hog3eFGfEh28MB8s3yIgrjJ9frZpJxGqTBrYBTkIe6FQTsXDhSK1/LFzYSqCNgNNyqhy1Ifr7G8i8JcCwbS+Av0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gYR6vYgg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gYR6vYgg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11605C4CEF7;
	Thu,  9 Apr 2026 05:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775712467;
	bh=t+0BZmDU/zTjG+nTgW8T89jWjq/MUHoxQ1+xLpqaEhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYR6vYgg1RQZcAK6LeSojU0zZ8A+WuNSGXI4ebGw0dD91j8CZEUrIC3rrYSKMf3Rr
	 7oeOQMXTRkFbpqMJy+AOHxsIZqrBiToy+8IOLbuy7IUcYLnWC96taQJP5kBZeI/h0m
	 3S/Lm4uUpHGOTqNIY8mkOV1OQNZTDPJTQ32+JN94=
Date: Thu, 9 Apr 2026 07:27:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Subject: Re: [PATCH v4 2/5] io_uring/cmd: zero-init pdu in
 io_uring_cmd_prep() to avoid UB
Message-ID: <2026040908-certainly-dealmaker-5530@gregkh>
References: <20260408140007.8401-1-sidong.yang@furiosa.ai>
 <20260408140007.8401-3-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408140007.8401-3-sidong.yang@furiosa.ai>

On Wed, Apr 08, 2026 at 01:59:59PM +0000, Sidong Yang wrote:
> The pdu field in io_uring_cmd may contain stale data when a request
> object is recycled from the slab cache. Accessing uninitialized or
> garbage memory can lead to undefined behavior in users of the pdu.

Who accesses this?  If that happens, then yes this is a problem, but if
not, then there's no need for this change, right (i.e. either this is a
bug to be fixed now or not.)

> Ensure the pdu buffer is cleared during io_uring_cmd_prep() so that
> each command starts from a well-defined state. This avoids exposing
> uninitialized memory and prevents potential misinterpretation of data
> from previous requests.

Where is the memory exposed and who misinterprets it?

> No functional change is intended other than guaranteeing that pdu is
> always zero-initialized before use.

This strongly implies that this is not needed at all.

thanks,

greg k-h
