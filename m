Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156487;
	b=SdAkav1lnuiTgnCxvho6KIqQ8h9BpXh7lBujO9veUCH9uiLeRuL19jZqFF7uCN4CydGo
	 DQY8IxbDY8DGBVOCb1sBES7ksUWd5/aK6N3UQJG1WhNRa/O/Ju9UB8ajHhUngdSbg05DE
	 uqApISLSXEmo0vF7lWw/Nh8fX9z6iPmtpJFKGY3iL31lQOZjgYxDuP50vEGtG2GkJXmia
	 eEXl5LWZQ8h7nAh542abE2laf2tDIWzbUCgNV2NeLQkTMSJaFn0KS+idnTkDTA3qBc9Qt
	 dJ4wWvgRjsJ4wMByK7WMF+pwEN9RQJp1c6aSwvli4f4xvSvgm6yirn3zeppSMDusQrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156487;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VBv5hcAUgEzlTojiQ+eEt+6YeW08V6/WtaCaBZ/AZQI=;
	b=YT4RZNOPDZ/El0DjNHOZuwzfusuNQ4mXS8l19O0F1HkVmJsZfsk12fwIBoJiqTB5lZOg
	 IxUJT25kWB00rs+TRdYgk+BiwBGv/2jnW6Phr8FBciySsIKLyOtVfzayB+Fbz9ze52Rdf
	 9t8dF9CAQiFpySIS07Bb/AGu9P/xt+f0pfbXJsLgZZVHaYXWP7ZBidYsopqlUdMwJT3LD
	 FZzAoBeXg5nNgSETRH3TL/inFDcGePHSKFATcF0Y8jXzzEkS4mWJM0sjoZn6Vi7j/1mzb
	 JAOSmoXUr6bO+wwhfiWvZ64maQoD6X7x/3TCVqYdvB2G3QhEU8wq+8zNMxHAjHfXztw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34778606A321;
	Wed, 28 Oct 2026 03:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34778606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d9c973fcd27b11f19a56ed5b684f684d-20261028
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7f81a148-96a7-4485-ac9b-e83a73b42a4c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:7b7f5bdb2756e189ad9093bde4904cfc,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0|15|50|99,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d9c973fcd27b11f19a56ed5b684f684d-20261028
X-User: liwang@kylinos.cn
Received: from [10.42.16.85] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liwang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 374288869; Wed, 28 Oct 2026 11:01:20 +0800
Message-ID: <36d782c9-d8a2-410e-8bb8-36bb6e9f9549@kylinos.cn>
Date: Wed, 28 Oct 2026 11:01:17 +0800
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/1] misc: fgds: introduce GPU-File direct I/O via
 dma-buf
To: Pavel Begunkov <asml.silence@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jens Axboe
 <axboe@kernel.dk>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mengmeng Zhao <zhaomengmeng@kylinos.cn>
References: <20260908131545.105987-1-liwang@kylinos.cn>
 <20261027090853.30099-1-liwang@kylinos.cn>
 <749e9437-85a6-45fa-b984-b155a1eeddaf@gmail.com>
Content-Language: en-GB
From: Li Wang <liwang@kylinos.cn>
In-Reply-To: <749e9437-85a6-45fa-b984-b155a1eeddaf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 27/10/2026 21:54, Pavel Begunkov wrote:
> Hey Li,
> 
> On 10/27/26 09:08, Li Wang wrote:
...
> 
> xfs support it a it orthogonal to the uapi question, but it should be
> implemented in xfs and not side stepped. There is an RFC on the mailing
> list from Anuj and Nitesh that is trying to do that.
> Thanks for the feedback!
As far as we know, Pavel's current work only supports direct data transfer 
between GPU memory and NVMe raw block devices. As Pavel pointed out, I 
tended to prefer an implementation that was as non-intrusive to the 
filesystem as possible. My rationale was that GPU-NVME direct data transfer 
would ideally not require filesystem opt-in, since there was no readahead, 
no caching, and no complex metadata operations involved here. In most cases, 
the filesystem merely helps translate file offsets into disk block addresses. 
Additionally, adopting an ioctl interface had a smaller impact scope and 
provided a simpler userspace synchronous operation interface.

We will track the community progress, and we appreciate being let know if 
there is anything we can help contribute to, as we are active users of 
this feature.

Thanks,
Li Wang
