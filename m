Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794755476D8
	for <io-uring@vger.kernel.org>; Wed, 14 Oct 2026 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988708; cv=pass; b=G1dxvSgXZ1gocllCC+GU1vTN4g+gP7g5myER5Pv2hdXisy+G1B+2mku3KDH2Kat1mDOoLOaPKcvkFsDUjo5DzYUpnBg3X3ZpwMZVRMLMgtiCrDfIQzJ9vCAGeZTWOv+MXtuwslJGvjadOxsY2BQ6BxWX1AqeZnPKlDSImeAe0Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988708; c=relaxed/simple;
	bh=Ht8GLTCoCKkoVxwpD5KYA+Pz/0xMc+C2begOQBfsCnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLiqn7fiCV028xCS36qWImGRmqKGHD8E8ul0XT/YwhFwK/eIjHIbQKoitTIwAAsxxgLGYPA7CR2cWlafLufoJBAP5vrpICWnVUcy1eunHeCFwMXkLKYNiU4b6Me7mJa7auAUZe5r//n3PN0eTYSWOPjuAVWvjrpELwwi2igbb4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cngxshHk; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cngxshHk"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1cc392d8bso1443144a12.1
        for <io-uring@vger.kernel.org>; Wed, 14 Oct 2026 07:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791988705; cv=none;
        d=google.com; s=arc-20260327;
        b=YSoT4JiC+n/KRuAnwFPBEAN3/hRT64CLx5CkgVLbuZcMmm/wEDt7iO5vDRxLLfPodH
         jv2aDHlFptvxqGYVCPXnqmWvjluhOkVMLgkp0T5VvTKAftyGyuJpZL5N22S74B4eCSMK
         TPOzCNK/uj1LSYY3m4CVN/W6Jl62erxJ7TcCN6WdmJQWYzovHV2qbBGIG87h9qFmLXT5
         1jzpwpbvCf8XOTC7u9wmQw+tEsiQXytkc+3B+sx5KmDWAa3958i3VWp/l1kPBIJEpZbW
         +nua8uGAuJJtNr2AaWh0h6fbV5SV3XpSz7aii6f+fhO/7VtdLlwJyuEHdm1iF+hZ/EOC
         r0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ht8GLTCoCKkoVxwpD5KYA+Pz/0xMc+C2begOQBfsCnM=;
        fh=Tm6O17OfxHY3QuY3wU50b+UXgXdDxNpty5wLJAblc8U=;
        b=P8hcJWWrNPsn8l30MD3w4TtMd/fv4Hik0/z1YtyJFVYO7IFxXDASigaLI8ZFRB9Ysv
         DYyqH92S3Y3AshnReC0COzUQM7CYhNAwo7x4cX+odD6A+Wp+MV1KBqN4uFwGdfZLiH2y
         pK0topl4ocdvRP3KnrwfQhYklukcxSJEjypedH3X+UdvxOMRBiwZSSFB2xPnkZMba0Jj
         AzlKpDjLGb0C6QdkHZoyWVtcQlKKtu6BwkMSIVft08g0eeDjWofWglwn4vrhIhjUo+fc
         oFJROBbrP/jEctx+H5HdmFnQpiz47fqoy/TA0oI+fL7QAbgzLGff2FexF74+NhCSDOT+
         pE7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791988705; x=1792593505; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ht8GLTCoCKkoVxwpD5KYA+Pz/0xMc+C2begOQBfsCnM=;
        b=cngxshHkw8vpezJT+yDObXyASEd/+1ZURQ3kSvVkslJTVzG3tDddeyu6Itpilt2JMA
         ec1WM/YYgS3Rq+vyX4T4IeWYoQ6OxvUiPFQKj/JmDAP4bVMSF7iOJ9EhmAZeTB6IBdyW
         hrr5fD+726lY+ajAr5CUAAonz79E10XEa2mHWfe7oiuU+5I4HQVr9qTl+RLPz1Diqx29
         GtSbTklK5jEE1PNTzOz4Evx6U/DUQ6OIJjmi6onPw4b4rseZ8zc4j/e6G/SDgBZfMjcD
         q01QWWumP4wG0aQUh+R5aOlmSu3VVONxsq4Rn1Mj6JpmuA+W5oTi/cpSHA+wcMS+164o
         h7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988705; x=1792593505;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ht8GLTCoCKkoVxwpD5KYA+Pz/0xMc+C2begOQBfsCnM=;
        b=EkC0tXy3UG4ePv8uuMrb9tlZy8NL7mEj9q4eVTNqBqS0gybnU8ERkUU13/y7IthJNS
         tN0BiFX3pJe95X6UeStLtOgTOn3o7CgjZN89/3XfwpXDDpP9igtf6VZn7ir4THsjFJlb
         XlXaXgtFdl4CWjSac9YDqqVx7NSyfkdZqlaXjpVXwIZPa6QKNaLS4AfLOm6PKCNvF9Oe
         1wTNzuL2bhOy9crtJchUmbsCbfaY7tbozUm5Q3l8tGh8Xs62Mqpjg5U4CUu4QhWuUfur
         kj42szEIOxjQjtKtTFCKkt3RqGkDXrbaE2u1EPsN6FFkwjDrRuntI2C/i5QfuTsUicPw
         Cy+A==
X-Forwarded-Encrypted: i=1; AKwUvBzzxNMRIjGJ/10dXmKsLb7lORU0jSkrmK0WGTtR49JAlKtfsVNJsip0Ho+0zg8oBVcrFiJdVzeYug==@vger.kernel.org
X-Gm-Message-State: AFq9FYKhbhPsLxBUXkkeCO3vCGtXD/J6SwYT+jclHWtywEKTKZQGrv4O
	gSgifSe8vBiowc8HnclqFEFzzv9esxPMNoev/DfnCMlvJMPhGQrdswvvXwrwLZ1pyJnwvEDqvAu
	us1fuPgPNszEQSaSOZmiKTpe+5bNJUQ==
X-Gm-Gg: AYBFou0cEmr5Qo9Rxg2Zuf21MldDiQG3YlvLcBYWBQxKTKsKelLFyaMAB3l2fH5RRzF
	dvS0J61pwUa4xHYJ6/5fPqIDi/BNGmUqnqrEnoFyvFJGMGXvRiQI7f6RqK0QOGRJ1C0Yy1VA7cD
	Ypj436UDyR30AchGKN0tkp3T6YnFFRK1g+2OxrANDHnca/K255fV595p54eypbW66BnKeZeDE5X
	n+jW3q14kParzK8qooYY+3Hp3HWop+0BQWtywbcAoDfK+WAX3AgqjvoWUtQeqjdKID/wY1DmLPa
	D8xpbbv1xmEsoKCL2+20PtABhjcwNhF8kTZFwsg8lDE7uPUp4/lgOxUP/pEDE9vI0+hjMt/vGz9
	rxtJzqJjJPs0Nk1FbpgBPu75lQTXcWEX/2/TKcEE=
X-Received: by 2002:a05:6402:1912:b0:6ac:b9b5:8e8b with SMTP id
 4fb4d7f45d1cf-6b17c2a3670mr12616709a12.15.1791988704432; Wed, 14 Oct 2026
 07:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791975048.git.asml.silence@gmail.com>
In-Reply-To: <cover.1791975048.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Wed, 14 Oct 2026 20:07:46 +0530
X-Gm-Features: AclHuK8DZ9QwF2AgJ3SDr4lT4xl3Cf9evBnlWqjNFK8bj0mT2h6JXCYZXSbhb_A
Message-ID: <CACzX3Ases=5auovox0XFNheDHY9iNmxv2BvB0dugC-W3mnjGLw@mail.gmail.com>
Subject: Re: [PATCH v11 00/13] Add dmabuf read/write via io_uring
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-nvme@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, 
	Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, 
	Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>, 
	William Power <william.power@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Tushar, William, Phil did a lot of testing and experimentation on various
> devices with previous versions of the patch set, and I've received lots
> of help from Anuj, Kanchan and Nitesh with investigations, testing, and
> patching. Earlier benchmarks by Anuj for IOMMU optimisations with udmabuf
> showed:
>
> STRICT: before = 570 KIOPS, after = 5.01 MIOPS
> LAZY: before = 1.93 MIOPS, after = 5.01 MIOPS
> PASSTHROUGH: before = 5.01 MIOPS, after = 5.01 MIOPS

I've been involved in the development of this series, so I won't add a
Reviewed-by tag, but I tested it on NVMe with both an AMD GPU dma-buf
and udmabuf exporter, using the liburing tests and custom fio plumbing.

Feel free to add:
Tested-by: Anuj Gupta <anuj20.g@samsung.com>
