Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1353E3DB31A
	for <io-uring@vger.kernel.org>; Sat, 12 Sep 2026 12:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217866; cv=none; b=B6cPYNxSdPQg8WUqX0kr6nd/Z0Ih9E8KFxqyNI/ap9TNQVUxm0M5pLLYCdKhy39A2JdW8n2HvdWehDPQ1RZJNvuaUV5gGFmZUsEka4w349ZS9yXxStlBkgZNFlbIHGaR5phnazgBYXtd/r7uPSAVr4WCDsaAjxFz7t3jIh5no+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217866; c=relaxed/simple;
	bh=6N0ifHQ8O4u0BOZ6EF0w79HnCW/yPo/3nI3uyCXuO9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJeGuVutu+NEDnPvE/AgsTmWHpj+W7D3sVLC0GXMgvKd3gCgBHntO2RpMIk8rTHYP8ivHLfZUZQkWNJdG1WsEtgMdRifvC2/vCWYerdAoxsHSSpEaKl8c50KtOHAvc5GIZ3BSNMmJWbbJuFJMI58PSjwq3OYDOEOl2n+WcOJx/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbjKGRPl; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbjKGRPl"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so229100f8f.2
        for <io-uring@vger.kernel.org>; Sat, 12 Sep 2026 05:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789217863; x=1789822663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAOw7eoVc0zYvL/f6e+XZRwdegk97u7KcjQYPN92otE=;
        b=EbjKGRPljO2qrPEBnoEgqtDd0zQR2r+b3aOlfB3jgvjj/jbfwJIrJQ/YRGqeY1ghsY
         8R+xMJzvmtU2vUoJgWCVLu3zb/Si657b8n2c9b/2fvU1Rjvl1Qo2syKdJ5MtwsU97aHr
         JR0/hflFEuGPvsfbVLaFsNkvbhYrfgrgTqjTfuLpevFO8i4fQAk0T6JI95zVtLxGvKRW
         5D9+WCEMSJYDHpBsGWwjOjB3CaRaoOMio/XI2tsfyi4PWplk2/n+kcXATlHyAq+fEKqV
         SZo3UrNg/gcthiubYF3MfmZGXIb3f2UnBhSrMpz1o07zsIMs79YhTc9n5SXdQi1W5E7B
         m8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217863; x=1789822663;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAOw7eoVc0zYvL/f6e+XZRwdegk97u7KcjQYPN92otE=;
        b=tUHnO/qxu0YYPQL6nFylnUhNwr1Zgol3Hm4tc/Wyr4vNmPeQTvg/dbRyXDcHnjpD+Z
         47watJRJgH3pwME4qvXhkCDakpx8z3Fbp0fSri3dMGmfzaZbFXFfebXvE+McyI4zaZsh
         T2ZlRFAdffhpkl7YYGkswPZEIE54fdrsP23Q3NW/xuvKqS3/YUvC46+xv0bt3Z+xVmJ4
         AQMOSxcQzg2KEsiOSbl1GdQU9nZycRhjQ8KymWDDqzotlk9Zq9czZY4QfuRTgWt1qw1U
         dQXVVCA6veP5mi7REiiRsH67l/bE9xQaQDyZYLFy8XhCA1GibaFEzJRPDfGZu6hJM5Mp
         zHzg==
X-Forwarded-Encrypted: i=1; AKwUvByegubi4kowXKal3SSPmWjqBCBMwEvocaP1qrv4ZCToYUcw7sPWTAFT8htqcwrVfmlds/sMzH5FXg==@vger.kernel.org
X-Gm-Message-State: AFuF++me1kHRnxCWALhdXb61LSn7iDe3Y1XFRE+DderGnaSuH1xMDI1o
	KWBuaETIYWH7C+23YW/9ldbC8sJbAQHm08fbU58i+tF2s5xLAg9fY5GW
X-Gm-Gg: AYBFou1O4VsxlOK1v5QupbEyeYNKSuK6U/Kc9GENbAFunZEQ1/NGXl8VLvJ4rRowE8g
	cZ0mpQQviSkUYuChf3b3fZdiRZlt+M7+9lNagKMkOoKzkLeJwveKsw952l2y8wSxtGiMG6zQ5H/
	ejK52ikdYSVdCnfydwr5f1gZtbIzp8YqIgM+BTneMdJM9o2Mu80BdyuaGB27haFtvzNf8/ob9RL
	hwKPa1jh5u/ko+DXYrtP1sKRpPtnq0z6MU943OP3/ICTDFPILEW8I+NRAwaYNcNq0NArYx4+fdL
	2jSbHaZTtdtzYdAzPzv8Hu6rCNC6OK0HQ276TPAHXFQPiuH1OP+n7dyG8cCwdGC3/xGfGcB81Rp
	uwQlhwCgUYzmgGEwgJZNqImjaHPC3MgOl2FSpbgnDpn1WOfLwzn3ey/FhQPxJE/WJIahSobT7lq
	fSR5c8zNwGvUkfhwEjZw7B5n5Ggf31WTIPkSIeq3Ic1zjpsSWwDg9/0sBw7NCLXZew0CWlckbfj
	geN3UUbYRi2zeWytrUnpL5GOmt8/jXbYQnbyr0XFnXnvs6YHJp6v6g/piRHk7cUd+i91mg8x/CF
	ZGQPo8lQXLHC79blEC5iItwTMXI=
X-Received: by 2002:a05:600c:6812:b0:49d:1d7e:4085 with SMTP id 5b1f17b1804b1-49e6cbec30dmr21535245e9.22.1789217862965;
        Sat, 12 Sep 2026 05:57:42 -0700 (PDT)
Received: from [10.192.161.217] (82-132-213-27.dab.02.net. [82.132.213.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm12751635f8f.9.2026.09.12.05.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 05:57:42 -0700 (PDT)
Message-ID: <0c787163-dd07-4389-b9d5-916b8753f388@gmail.com>
Date: Sat, 12 Sep 2026 13:57:37 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/16] Add dmabuf read/write via io_uring
To: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Damien Le Moal <dlemoal@kernel.org>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, David Sterba <dsterba@suse.com>,
 Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev,
 nvdimm@lists.linux.dev, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
References: <cover.1785596451.git.asml.silence@gmail.com>
 <178907372259.484803.15807864431748251506.b4-ty@b4>
 <eb469580-509a-4895-a819-e7f3e4fa0b0a@kernel.dk>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <eb469580-509a-4895-a819-e7f3e4fa0b0a@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 21:58, Jens Axboe wrote:
> On 9/10/26 2:55 PM, Jens Axboe wrote:
>>
>> On Sat, 01 Aug 2026 16:46:12 +0100, Pavel Begunkov wrote:
>>> The patch set allows to register a dmabuf to an io_uring instance for
>>> a specified file and use it with io_uring read / write requests. The
>>> infrastructure is not tied to io_uring and there could be more users
>>> in the future. A similar idea was attempted some years ago by Keith [1]
>>> (from where I borrowed a good number of changes). Later it was brough
>>> back up to life by Tushar and Vishal.
>>>
>>> [...]
>>
>> Applied, thanks!
> 
> Eh no it is not applied, was just looking at the series locally and I
> guess it got added to the b4 ty pile.
> 
> I am, however, wondering if we'll see a v6 of this soon? I had some
> comments on the nvme dma mapping, that can be improved, but I'd rather
> defer that to post getting this included.

Working on it

-- 
Pavel Begunkov

