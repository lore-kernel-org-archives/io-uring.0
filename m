Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564F954B1C1
	for <io-uring@vger.kernel.org>; Tue, 22 Sep 2026 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085284; cv=none; b=qSbk4A0VVnAr64ypfyAMxvpaKq6VWNqT5HvkgLG31zQpdQ+K4db9mGiPpiyhPv6nePiX3SE1vxC1m4y9f/+Y6dC6I9yMkJrZSO523DRWOUrXer/LAPUKvEc/kQ3mQUkOEl7QKRRLdzqi1jG40NPtT/QngVG92RmJjNppU67FfKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085284; c=relaxed/simple;
	bh=of1kRO6ILjWAgj4iFFg39n1f9ag2O5+deE7KCawy++g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9Q8wpo74xL9rbFEsbI7Oa91X1ukaoPMKPwwoIy6a+7CrQU7I6p+ok3qBhssitnDJP7Ew6ByzNes/tvC7/mBmoLLl2snwL8i30AsCeL1uReR7w6a7cwqX+mrRk1YIDubM+9+1vFlbZSE+LbJyxPsmneIvN2Mehn75kc9WTcQvTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbWDwiAg; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbWDwiAg"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so379962866b.2
        for <io-uring@vger.kernel.org>; Tue, 22 Sep 2026 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790085280; x=1790690080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufPZGPSZBLf6/pwvKrChnuajCoyQv+QtMvUQGkdovhk=;
        b=JbWDwiAgvuWT6Uu42JjZYnRml38hEKzTCJ6Q9fYTgb9qCSitbHdSQyR0+2K5JnqsWK
         lC6m13cAB5KIQu2DdJNmT6TELiaso3Rnm0Py4f/MZ4m0xAhgaSQMFPfRjenPHTxyEB00
         813UI4lAirAeDf2dit0LlDoI52HKmdGR6bDAiF9XXtzZVUtiTRG2hJGYySOo7kE9MI1q
         nmQ+XVAVp9IFiilUPlvhMkBTHJ51+C0PtnzBuZmG3D7cnuyd3XYJsmR71f59Vm+RenZ6
         Td5j8LVipadxst801DvaEnxsSSZdE6wa31YaEL0ph/skpusJElsrFnI+nXqbskIVLZKL
         KSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085280; x=1790690080;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufPZGPSZBLf6/pwvKrChnuajCoyQv+QtMvUQGkdovhk=;
        b=H1XCJNNPvBOfLz93QxLBj4DQ6Rh6/fs58sjjEZHcdCwdm1UvoqLRx7VdIqKXDKZiRc
         +2p1W2IG4VYkYfjT/+zXSCZqSIiRvnrvw2tikcXF3scOkspf3UW9WIsOU9XfL1v+AKnm
         SphBItRq8dFsY+M6o1IfFyDllkuPtlP8jwgNcw7oHBdzieRGwVLylE6q1PXiNpCkMSi7
         NC0s4R1YulFB1IlcOX/OleAcwH+4xOpXMHjKDLA289qX0sYNjXZeZNZqqvcwjCr1+zh2
         PuUvR1fu8ZqYv2tSm7XUlE50bXoEDTHHS8HIAzQt/0fTV9gsk2Tn6157IjJjZGjPeh59
         k9ng==
X-Forwarded-Encrypted: i=1; AKwUvBw0D70OMkWPG3vML3DZSCdBwCiQOvN/LXMf37Zrf1rj6a9XdmrYGnX5wDH3v+bnmXHCUXAyl495gQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nupwHAtamSWGUd6A9AnwUOIcYIV63hSi8vTCJps00NQaW877Z1
	hwkxn48LJtgkdVWdE8e+iAbEkM/UBZNhaVJQqWt8EA2m16QFeVI4fmEH
X-Gm-Gg: AYBFou0HzjoNEsHN9B+KxRqDEGXzpDUj8t+P2uzjZf1ibC9/dlYYSf00dPds5xcoWnD
	8u/0y1QzXdv1WxOCyoo4NYidA3yU/SnwNN+FzRE2ReVchN6LJ5ziqKU8Jh4vjpMpMSiiBJYxaYA
	Vxf7iJGibBgOllvDE5C6HY5uhwwfCZI+2Jp0ws7AE05ckk4ZBvEtmkoRTpIOHwAOFeeWO6oX5Bp
	ucQwU/o474dfO1elHx/PHGMEyrUjX0V40mdusFxc5wJT/4rampayBR8GTEx3sHBnukFLRjEgZ/l
	73aWvumcE8cJ6qk6dvgs7kuLYtXWYvfLY0kdzzfChUAEEQ9mx1h1OZac2wKJtc7KthjqpJjyHqs
	L/LWPVxXUkwgVDNdnWrtNJ88HAT+dX40gxQ6/RVLoQs+AlCUbcc8TEu+BauS/ibF1GBNklrWmaM
	Xjd+qUQzul/hqFocCmWNyJKz8KS5xQ8NknawbtFvJlB9p+SFhO9Kd2ktFuqaJB1ieX5WKaIMG5a
	MDihL/BlHiQAWq5breapOw/VCRVcYaTz4sIvaaNST2UCCfWBjaTizicBqtAnGFmhSz/MEzgvvCT
	qZu4dKd1+6XOGrfi/kGWRGV5vNoG
X-Received: by 2002:a17:906:c111:b0:c29:f5d8:9c6d with SMTP id a640c23a62f3a-c2a15802eb7mr1217098966b.28.1790085280498;
        Tue, 22 Sep 2026 06:54:40 -0700 (PDT)
Received: from [10.54.182.141] (82-132-213-197.dab.02.net. [82.132.213.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5baa1bsm93202166b.39.2026.09.22.06.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:54:39 -0700 (PDT)
Message-ID: <cce62c72-278a-44d1-9cf7-e0beb0b72688@gmail.com>
Date: Tue, 22 Sep 2026 14:54:25 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/13] block: introduce dma map backed bio type
To: Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1789997898.git.asml.silence@gmail.com>
 <a3ee719abc440ca139f1a945fdaf43a45f0c6b57.1789997898.git.asml.silence@gmail.com>
 <20260922131610.GA30468@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260922131610.GA30468@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 14:16, Christoph Hellwig wrote:
> On Mon, Sep 21, 2026 at 02:38:48PM +0100, Pavel Begunkov wrote:
>> Premapped buffers don't require a generic bio_vec since these have
>> already been dma mapped. Repurpose the bi_io_vec space to strore dmabuf
> 
> s/strore/store/
> 
> Can you please expland on the splitting considerations a bit?  Preferably
> both in a comment for the details, and in the commit log for how we
> arrived at them and why they are fine for now?

I'll add something to the commit log, but not sure which specific
details in comments you mean. Do you want me to expand the comment
above limiting the number of segments? Maybe I should add there that
it's stricter than necessary and might cause more splitting than
necessary? This one:

/*
  * Limit by the number of segments. We don't expose the underlying
  * mapping layout, but with a known minimum segment size, any I/O
  * consisting of N full segments should be able to cover at least
  * this much.
  */

-- 
Pavel Begunkov

