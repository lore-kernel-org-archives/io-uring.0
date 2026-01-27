Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF995145348;
	Tue, 27 Jan 2026 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769506463; cv=none; b=LRq1qDKf1Q8JbXJDK8s/SKR0Zc3nrSVLs80t380huENlEy4QglI0/VDmCQj6pWpTvHNsQBzIxas0Heka/VzCZ+Obf8lg9CwEokT0heEnM+QJ4Zv3168WpOx8ZE2vp4xamwbMQRCF05lWomPSxSIRN9PEK5eH/aWKrU9MI38oclI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769506463; c=relaxed/simple;
	bh=Oeqde1iXFjF4bUaS30gl3n5AwzqPTBHOIALHv+J0baA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FcBSPda4+cy9B0T+j1/ayyVRVyyPhNzsgojaClVVIRXsZ0J7/i8j588x9rEFVMkcZHo94n+aUUo2MHRtUcbKjfpvm44QKY8XVVVIUdai2sSInuBNAbn8ZHXODOyU2t43SUVL9NH6NHh5laKQv40DgfyD/3XugsHUsm0qiD5V3Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqMo1EL8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqMo1EL8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E3DC116C6;
	Tue, 27 Jan 2026 09:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769506463;
	bh=Oeqde1iXFjF4bUaS30gl3n5AwzqPTBHOIALHv+J0baA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QqMo1EL8kd5LZQOCimCtbh8gBS29Z8Db1w+fC6wj8BDv9Yj2rQyxW4BKH/C2n9Q7F
	 0pqt52SEZ+DfCbGHQAxvNVbrqA64D2Vt9UAM2Qc2Cqy4Z1IqtEzrMgX2CoHnEC1qQZ
	 xoX3cw051mf5GSq1PMx1ZsuyZ3XGzbHEK6ePQvuMYoLO9nyz+MLp2qT+/kkEHmZwfG
	 jEsrp4oNLj7kZ665ArwWQZ3hy3iYQ8SkObFQUmgeRI5+CJi0pWLPg+XpaMlUajxzjd
	 yHRgQMko6w4WuX7gBWw+5bjaridpMxu0IhhYEMXkxC2uDXF6KW8KqQ8HGNYy9ySQnw
	 rcNAjxS1DpJQA==
Date: Tue, 27 Jan 2026 10:34:19 +0100
From: Christian Brauner <brauner@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, jannh@google.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] io_uring/bpf_filter: add ref counts to struct
 io_bpf_filter
Message-ID: <20260127-strapazen-beziffern-e39606e85f2f@brauner>
References: <20260119235456.1722452-1-axboe@kernel.dk>
 <20260119235456.1722452-6-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119235456.1722452-6-axboe@kernel.dk>

On Mon, Jan 19, 2026 at 04:54:28PM -0700, Jens Axboe wrote:
> In preparation for allowing inheritance of BPF filters and filter
> tables, add a reference count to the filter. This allows multiple tables
> to safely include the same filter.
> 
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---

Reviewed-by: Christian Brauner <brauner@kernel.org>
