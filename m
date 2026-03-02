Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3674C3C2793;
	Mon,  2 Mar 2026 20:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772484121; cv=none; b=oOt6VzADjv4akMcmEW/2WUiKiazrE5qQrNWWLZj0D7lsM64x9mELTIA0sX4bcfGZmJJsjFkoQbrllUcHZu+VYJRvdCQwE+STmbWgK0TytsQPS5g3kCy7XgJk3khefB0BK6IaIlOeERvOouUyxQ1q5McN2JbNM5btAZF5/90beQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772484121; c=relaxed/simple;
	bh=+gWOD8yqeGsJ0eX1W/xc36dz/JG4OnOtFx1cvmAT0uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLUI4WS5Wjp81mEUxYhryhANj/IxZruuK7iC1xy6fXHqW+nfDM6P74fKNStS+5UcCuyOWLjIhOZocgcp9WuCE3SBuHysQuWX8n6hhC/Lh+Peq6Pzfqcn72v8f1PDMb2VaO4te8GtGeHSTZbvI/6CXsBjzgOVVyqd/aemMuaHh6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhhfr3dP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhhfr3dP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A1DC19423;
	Mon,  2 Mar 2026 20:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772484121;
	bh=+gWOD8yqeGsJ0eX1W/xc36dz/JG4OnOtFx1cvmAT0uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jhhfr3dPuea9l2dh0lsqH+96h320+98IEwoRlnL2P+QYMU8121LJGdiVNSIylfIXm
	 HTWU6c0JLP9laKZvcI2+dV90Y6uPOEqUkecBSlvJQAFfn4cp2kh/WkIgkvQ/gahvz3
	 zNfAZmJjez0CVDAWHUZ4fKIwLZlEjBPEOoKAk8X/5hUUQ+w3EO2RIyZeIzu/QlKQLW
	 qEckb7d3bZqWNrGVLKtIn2noioDs2wtYVl3peTPUGpzkQZmmSDLSgvDIuNzJUObgDV
	 BLy+4GcNr8glQdCU8ObfOYM9m9VbhZZ/qeIbymW/4L5YoeF9F+bzmBSkoYTOXk1VNZ
	 k8oJGF92J+/Tw==
Date: Mon, 2 Mar 2026 15:41:59 -0500
From: Sasha Levin <sashal@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: stable@vger.kernel.org, io-uring@vger.kernel.org
Subject: Re: FAILED: Patch "io_uring/filetable: clamp alloc_hint to the
 configured alloc range" failed to apply to 6.1-stable tree
Message-ID: <aaX2F5LGPcqaDXum@laps>
References: <20260301014717.1711200-1-sashal@kernel.org>
 <eb41b6f9-08f4-4972-99d4-3340571830bc@kernel.dk>
 <8e84b6c3-e62d-4aef-90b7-a7a0e63d8a17@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <8e84b6c3-e62d-4aef-90b7-a7a0e63d8a17@kernel.dk>

On Mon, Mar 02, 2026 at 01:38:37PM -0700, Jens Axboe wrote:
>On 3/1/26 6:15 AM, Jens Axboe wrote:
>> On 2/28/26 6:47 PM, Sasha Levin wrote:
>>> The patch below does not apply to the 6.1-stable tree.
>>> If someone wants it applied there, or to any other stable or longterm
>>> tree, then please email the backport, including the original git commit
>>> id to <stable@vger.kernel.org>.
>>
>> And this one also picks cleanly into 6.1-stable. Not sure what is
>> going on at your end?
>
>Are these and the other "FAILED" false positives getting applied or
>not? I didn't hear anything back on any of them.

Appologies for all of this. There's an explanation of what happened here:
https://lore.kernel.org/all/aaWWE5uQqz_eG69i@laps/

These should be part of the -rc2 I did earlier today.

-- 
Thanks,
Sasha
