Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD0347ACCF
	for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 13:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330555; cv=none; b=dRIOjnw1PlwLSNcXyutmK0MPUdletXwe9JZ9tT2EHTIzdlIOmt6v1VHzJKm8tRQo8zpXFUqdkx6ZpfdXPKa1hyaE5owkQY/T9fgDsz7aAbHNLlTpX6E9z2zvP1ruDi3bUmvn9/l+2VzYPMaX4Lz2gW7p73xbG0YHlaHlTnZHDfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330555; c=relaxed/simple;
	bh=RMWSxEPwnyLa/061OQ95QqTIugHWJGG2wh5+43JQ5dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hQTLfmTesE9YLDU0Vr7HTiK9c8eD2Zhzz777yrUE85QI6PyrZrthO2GHEgTYKJ7UdDHIl3bdUfeOH9XKWq6ik1QOa5vkj3OI44zR+hatiCrNdLFbSuZc0nLVPUJCNQ1OfiFyBhsUtv99BnfAhqVirKuXxNYahC/TGr/qy2VbPNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ti/WRjzu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ti/WRjzu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so9240965e9.0
        for <io-uring@vger.kernel.org>; Wed, 29 Jul 2026 06:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785330547; x=1785935347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YUW97RbS/cuxZAvn9F7FgEb6B/w45ofSr5IJCTvWkgY=;
        b=Ti/WRjzufwHIizTPl3Yx5oIV0FpU0h3lA8EgQ6GBhVBPYMW2zDrVieQ4twNuhHAe59
         gcwvB1WzdH6eL6+CBuhgtYNcIPzjY9ZuYT5gflPOsDGyoSgi3782oNSwLl0o5hi7Le2M
         8D5TY2a7YgIdbVU4XjTaZci2MLeGQ/5adHRzm6dcunCqj4Lbw0YI4Ro2dzNPol8qObg5
         Ay4ZDbYD78zsZqiZ3ppoPb5Ww8ajctBCqM3Pm1DfCRkBHzMAPORWapS6GElp2k+w3EE4
         NPyoNcJOzpYISXFyeYgfQdUHPhpimOkhWUI1R7qytwlwsolABWCZOeutcrfzaNijWbSS
         9qjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330547; x=1785935347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUW97RbS/cuxZAvn9F7FgEb6B/w45ofSr5IJCTvWkgY=;
        b=Cv/gMCgh671ErtAUFCt9tkIZSf0+/jOYLLlAbGkoqB2TMrTd1V3bL5+INlDxxFeQGN
         XYE90Y4WSl5kJ8w25HuK2sK12Jqoscg0SYWA5J3Ft2LkUiIxqiBiA7ZXm/b3k2bl6/yp
         5LalDRaxVmxQeoQqUClQynNnTdNrRirtQvQ7r0/Peo5G/BgJrtKWb1XSH4jd0zsiLgwn
         axN+bysLfOCYqj32TSdZQfO2oF1sOEbILcjg9EhjqgAZhyCGV6p+SJYjhrTI+d19BZMH
         6ODHHbdrnrRdL/LFRc1ngqUUzs5tFMNQCodi64JoHCvAjRFACCm1TbZJqpHhhK45oydE
         jY4A==
X-Forwarded-Encrypted: i=1; AHgh+RqrL2RfpKmtesWkuGOry83BBrwbfHYuBLOvQiWUrNLJ3DxRbzna9IXvgdAR9GN0+tAiMyM4SzZ4hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhrdSnGP56zOKY8Z2W1OdsM6oGTUWI3D3owuvTD2NHGHXySJgU
	zGnoA5BLyLyTdCm/Xe3d2EOSux3Vq3DU5riZss91zelK9wNZVT/Uhy2d
X-Gm-Gg: AR+sD13XPOCRVnHBxVOtzs5wLWiz/Vdq/Af/kqIR83Acrxq9hyk/ZSQ0LycIo014ic7
	6FXNg2BVt7Ex4CMxAhIh7BNVgfZo225I7lNGobwDkHh/8rdHEMldVN+AzC3AXxrZonzV5jhESmN
	z9iv1AreBYIWquHa7CH2C5J/xPbjd3RlVuTlkaunYHEe2nmy0cC2FcNdG3SoiqfcptmYDfk+156
	M+gQHZBb6N6b8efatLNt6shI1P+rG42XIbt3nogNjAGNTZM00oUJmuuFBb7Xvd4kzkB7xIQ4TM8
	ekQgcGgyPbc3T9bvwXSDfDFezsYlIAQRFDwnzHWeY3g2ePQGPCRbCOtx1dm1207unpV64NJXJ0E
	2FJ8NoEKVsG84lvkIRx8gi3eqvX2VYUdBLzn6vit0Ubdz4b6a5wW9HkEXslgoYOERmCnBDUEJO1
	UncHPxoBqZyRUqPXIrf5CGVQPujIU2SGH53kgUxBgV1RtBk6FqYrYXpPZ2E1Mc3CUn3+SX8sMpj
	0i+q5T+IA88NGpO5bV4rNUMbx5KowBg4ViD18cXijSryh+3Ewk2jDnhY08y0tDFeKGSmYuhF8Td
	9oEcpPceuHgl78KD36E=
X-Received: by 2002:a05:600c:348c:b0:495:4fd4:f7b6 with SMTP id 5b1f17b1804b1-496c659f7e1mr79358045e9.37.1785330546620;
        Wed, 29 Jul 2026 06:09:06 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49764d70014sm93438595e9.3.2026.07.29.06.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:09:05 -0700 (PDT)
Message-ID: <8160ce17-6f14-4946-9146-3d261e8398d3@gmail.com>
Date: Wed, 29 Jul 2026 14:08:50 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/14] nvme-pci: add SGL support for the dmabuf path
To: Christoph Hellwig <hch@lst.de>
Cc: Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>, Jens Axboe
 <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Damien Le Moal <dlemoal@kernel.org>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, David Sterba <dsterba@suse.com>,
 Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev,
 nvdimm@lists.linux.dev, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, cpgs@samsung.com
References: <cover.1785274111.git.asml.silence@gmail.com>
 <5c2e9c3bdd3e87c0c9a6e4395ea199002b83fd36.1785274111.git.asml.silence@gmail.com>
 <CGME20260729072126epcas5p3ad4422a45f1274b71f15dec8bf487fcc@epcas5p3.samsung.com>
 <20260729072117.GI9534@lst.de>
 <81412691.21785320403945.JavaMail.epsvc@epcpadp1new>
 <20260729113108.GA31120@lst.de>
 <b03bba6f-0a8f-41fc-af59-2a69d271f28b@gmail.com>
 <20260729115540.GA32573@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260729115540.GA32573@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 12:55, Christoph Hellwig wrote:
> On Wed, Jul 29, 2026 at 12:45:47PM +0100, Pavel Begunkov wrote:
>> It was exposed in early version as I was passing a [{dma,len}, ...]
>> array, but we moved from that. Maybe I should put the minimum
>> segment size in the map structure, and (possibly over) split using
>> that for now? Keith had this chunk in his patches:
>>
>> +		int offset = offset_in_page(bio->bi_iter.bi_bvec_done);
>> +
>> +		nsegs = ALIGN(bio->bi_iter.bi_size + offset, PAGE_SIZE) >>
>> +								PAGE_SHIFT;
>> +		if (bio->bi_iter.bi_size > max_bytes) {
>> +			bytes = max_bytes;
>> +			nsegs = (bytes + offset) >> PAGE_SHIFT;
>> +		} else if (nsegs > lim->max_segments) {
>> +			nsegs = lim->max_segments;
>> +			bytes = PAGE_SIZE * nsegs - offset;
>> +		} else {
>> +			*segs = nsegs;
>> +			return NULL;
>> +		}
> 
> This seems very pessimistic, especially for the case of the registration
> only having a single segment, which I'd expect to be fairly common due
> to P2P bar mappings, huge pages or IOMMU coalescing.  So at very least

Agree that PAGE_SIZE is too pessimistic, but I'd calculate it from
the sg table on registration and use here. Not ideal but should cover
most common cases like huge pages.

> we'd want to special case that, but in an idea world the caller would
> be required to provide a useful nr_segments for the I/O.

Not sure we can do it in the straightforward way from the abstraction
perspective, mapping are hidden from io_uring, and there could be
multi-device files with differently shaped IOMMU mappings at some
point. We'll surely need readv/writev support later, so maybe we can
improve while doing that as it'd mean passing a {off,len} of some
sort from io_uring.

-- 
Pavel Begunkov

