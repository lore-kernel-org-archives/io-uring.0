Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E23322FDE6
	for <io-uring@vger.kernel.org>; Thu,  6 Aug 2026 12:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018900; cv=none; b=FTyy2wtwmxy/oYW1+q78UVYLFFTnWiUNZvDwW3hgDSGTsihlT1Qr9QGgy9Dcyb3DW0C2siaCIx1GXmdu6zINvvEIChiOuH8Q2Z09vyq+egEiBxkUgpr7vA43J6dAej3Qtf/jCDfjNFK7jsNQDigJp3DrFUQk6JpYzJoog286LVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018900; c=relaxed/simple;
	bh=TTiHlStxZcKVKrwqcuDMLj38rBSP7TpoZoQlRZGLyrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mDmF16GDdOWlg6kv5+Pg18cg0f+WsWJyBBSvqP/BJTUyNPWXEBz3izm9G9GTAIiRMlAcT7KOf3BN3ly3PnWzXmLy+gDo8lonAcpyekq8O26Cuy8ngUSrkc/fC1eMEEVqsW9FSgDYc7InyCfIu8AuCSjQcLvbXi8Sj3IEmFkKwxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJn+DDkP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJn+DDkP"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fd66a094eso856428f8f.3
        for <io-uring@vger.kernel.org>; Thu, 06 Aug 2026 05:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786018896; x=1786623696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfDlnjwEjqQiBft6//i9aWDA7+Wxp9IrqsB/3Fhaw40=;
        b=XJn+DDkPJjP/V2NYxQMNMiUSztdxL5BX3WbOePcGIWTdGsldovqU+YfLJCrgljR9wi
         Y7Zz1/sSG7RzzLYA2LPhGo+cnU6cJb9RbZpDL23FjZFb+K4qZGkYxZJToxsT0UUNh/da
         4gSd5ws2QvWA2bITT/VCjrmjCHJzcr07+p8KF1EhyRnckQU+Fjc8duNsPqwMsXZLrnJw
         8XeSVdu3KCL8RgMkdeKpLnPdI6TcVjzcqv11BdjCHvpdXY4YJW9NTiepW9CXB4dA8Ml1
         3OATNWEVAQ3M8+khX9YopaUgISPtmr84CTmTp5pvcKP+jJCJPvR7s8sU9HZX6DBjg+gs
         W/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018896; x=1786623696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfDlnjwEjqQiBft6//i9aWDA7+Wxp9IrqsB/3Fhaw40=;
        b=s7nOcdGWNBDLxZ6M3yfJyiWnSiplAGAZMdyoTTl8xlxLaSRRTevfo44oFoumuAnUdn
         ohSYieOBeigUs9bV2QUO9Tyyx9CX7kO/ZUin2Vuw0IN4s0d26IPi9ZvRbRex8fY/lmz7
         fPg00IxGXX3Ed79+cbaQset1s77n3HBfSzbf/VSZEUOI5GEDcs7+7rcHWtE+Z5/GMuIF
         rQfKVp1453KYWiDbMmIQelosmuzEsIXg11x6Z1J9wY8OTwgNKg3QdW2LGLyLAPmE4TAY
         bWyl/dkzGnNpxVuMTJe/4IG8R8QVdYqyZ1QVSDwvIkRWO1stybmYqz8Fo3a+FxeXM6Yq
         Z1QQ==
X-Forwarded-Encrypted: i=1; AHgh+RoaJkecDyZUddN+FLn5+C83922JnG6Ll3SUJwg4xGXmnN5H+TcgL9sAiMAnrVV3AiQrKyxYEyTCBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxepBGZdglZ2E73Xt/5FWd1tdnV7cRVYwxkEnBV6WpWr5YYXaN7
	A4sdyAY+9lME/fMdcPaa314fvh2cuAnEjzCInK3//+CwFdQ0Bw2N5Ewr
X-Gm-Gg: AR+sD128T25wWz45Y8NY6/hj2qkDsE2EeK385XAru3ecCriisjvP3D5LbE50jpT9rh2
	Pq0Ge/9JCh+6YEvA6YEPHbbhToZwMiYtIXQWzRf36MxrSXdCAvi4ManGjeY2nXdCXLTIma6ZL/4
	mJcxb5aY2gT5dvuT5/iiMoCLm0BZCu9VXVxqbc8gCPwRB1RexEuz/6SKEzV/0vfHi0mxd+gqmpX
	gc8Pm5GZI0uvwyhHcYFzPdeWapmTQot0a+IL9a3hdRdrkp44rnqS6tjBojR+32GI19uzWynTPSY
	RKNyJ08OxL5rwdH95O8d0EPlh8ktDjBFMB/C/x+2zw/6pxUFFQQ/KqBgEG87NmTAOttqgPJwEZQ
	rB4fdY5XnwMt8uZnK/XXJlH+P8dMAvvrBlsJugDVZXXbeucA8Q2JGdNWttOkIJn0RmlLFZYiakB
	SQGN4Z7CYykiAMZtd9babavcGyetn6Dpt1x4h6nVu+YPNx1slRp6VWXgr8kSsOBrHqif34DUJdm
	0XlCIvA2laGUMxW2jQKFl4/+MgAec4YUXVvDdbZLn5l2R5tBv6ZNDeFGqS6QFNIFbPB3o6F0TEx
	mEJ5SeEAXk9iSz7Z5w43FjdkLTwczwIUqwyY5w==
X-Received: by 2002:a05:6000:290d:b0:47f:f42e:9715 with SMTP id ffacd0b85a97d-47ff42e974fmr10864047f8f.12.1786018896398;
        Thu, 06 Aug 2026 05:21:36 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b32492sm5927425f8f.35.2026.08.06.05.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 05:21:35 -0700 (PDT)
Message-ID: <f47ed617-5ee7-4259-9f5f-a6fd0f5aab24@gmail.com>
Date: Thu, 6 Aug 2026 13:21:38 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] block: rename bi_bvec_done
To: linux-block@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <dlemoal@kernel.org>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>,
 Dongsheng Yang <dongsheng.yang@linux.dev>, Zheng Gu <cengku@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Chris Mason <clm@fb.com>,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Ilya Dryomov
 <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>, Hannes Reinecke <hare@kernel.org>,
 linux-doc@vger.kernel.org, dm-devel@lists.linux.dev, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-btrfs@vger.kernel.org,
 io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org
References: <4e4c21858705a200bd8848ffe4080522e3eb5c1c.1786018753.git.asml.silence@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <4e4c21858705a200bd8848ffe4080522e3eb5c1c.1786018753.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 13:19, Pavel Begunkov wrote:
> struct bvec_iter::bi_bvec_done is used an offset in the current bvec,
> let's rename it accordingly for better clarity. I also plan to use it
> for non-bvec based iteration in the future like dma-buf, so drop the
> "bvec" part.

I have this patch for the dma-buf patch set, but it's a very noisy
one, and I've got an impression that it'd be a good thing to do
regardless. Hence sending separately hoping it'd get into 7.3

-- 
Pavel Begunkov

