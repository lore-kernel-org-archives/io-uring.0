Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2553C4DAFBC
	for <io-uring@vger.kernel.org>; Fri,  9 Oct 2026 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546517; cv=none; b=GutQMO3oYoRZ5XvoAedq0jhEDpPVkVWUdqTXTw2GoaXwk4ps8qpqmINftXLwzFy6JAOJv6a0Ob3UGoo+Io/JiBzFPKhXeHg+Zwr/yCfA6+4CIxncmkG4i9fam4xK0kk/K2Kj8HaDdCxgPV3YcoHuLaZE7Eedy2cuu79Xbt9Bi6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546517; c=relaxed/simple;
	bh=L9Mu6TVdRZKeFQK7WH9Q7loQktaaTwQONlQN9eWWY/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWWEQTHwxpgfaN6ZOJQ+ODyVvntzQLX7FU7CGWzdgJs32s7BA92CEiUwrkzuIR9nG/fU/cFiuNkxzv9GylmWdqo1lVc3+ZwXVkDS5IWbC6ADv7tvgbo903pgUFLcQ914kALkUuqbQDrTswBhb5vsD0h1jAwRDQcMkMsag8Hb14w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmiVd6Q/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmiVd6Q/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a020e65269so30275485e9.2
        for <io-uring@vger.kernel.org>; Fri, 09 Oct 2026 04:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791546508; x=1792151308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCCGgGZDQeI7my+YCg9m6LCCcgGyvTNAraqlhrrWfdo=;
        b=jmiVd6Q/pGd9ExvpB7Y527Mdro2HSD2UetYFVdqiNXyvEdzjxYYfx6a0/TEhu2OZ26
         bLGShUFLppW8HvXwJ64oU6nOqVMCHJPQvWqZgwnxqpgjXgoQ88cOI4EHbInwwZWuY8LM
         5C3c5bMYI1FxoGUxacCzZ0ZlTDtp51C+iRp6hqYKzZf70p6y9Hh4B2CtSGuswUHQ71Go
         w3aN9BuGbqY2OWKTCQlcEag6TRQuqtdPSv84WsgZdKzgswIM5j472uzn9gg+/NG9vp1v
         EroVq4Bi27fXhGh4yquNPw2Qh0PzifvEbdhctRyWPdkCl1gTI7l5uCqTzyqy4VtTDlPA
         YW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791546508; x=1792151308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCCGgGZDQeI7my+YCg9m6LCCcgGyvTNAraqlhrrWfdo=;
        b=H1ZnfqZCRsIlKmfXpwFy5r5hlPIzEqazzALVk/VJ20prZ84iAdj9W+xSDmEvd3v0MJ
         7a6qNpIXotPHWZ4HefAg10pRPmz9o8kbuM373YFbQOv+ENN8gUUkiTLIniyGjZ1Ec2HZ
         PT5FZIU2wmnvFN6cjkRkOrt+Nf7YjrDBv5zstdfdC0mY+Oxg1PPgsgPJbUwyuhCy/l/1
         45mJsY/yAyT62Qsh4r5iAnp/EcNdkaUhmn7ip2bcRLBywRvvyHWz74MrUj6iHz9+z1t1
         BW/c0ZgxzqWDCLHpDpvqQR30ZkU3AaGkv9HztUlzFob9Z+bl79WvEMvVnsdR83ySbh9z
         RFqA==
X-Forwarded-Encrypted: i=1; AKwUvByclrVld3BkS5+RDZK+fTtSuQHzFYcZqnej64WiognlMxCMPesUn0JyxAGVsvSJm/YcWIVRk7JAgg==@vger.kernel.org
X-Gm-Message-State: AFuF++mnph4iK3yJBO33+ECF3Xg/9TYMPYEOkQHQ7mgSlUkbC/Y2M0tX
	4jjM8xhfEwGhU9xnHe0WR+a5uYATFJLOvJfnmiAVILiu+uPlfqQxS45X15WR4w==
X-Gm-Gg: AYBFou150dEdBsc0L23M4E/XSh/7WT+r+OgAQBg9A/U4rAESGPVvGpXxLLKfTIiZboB
	hNzqlnhbtYY+keW7a4cSnwIhyiiykhImfk7knyXiEuiO3GGz51BGUs9vVuD1/bg17Pw/aQ+TErk
	9xzrjRqVXdra1G7csOW9ZWlZK6o96Ky9SO/PKUSZVfMkIySkWGOjWn8u7+92lR+M+0Qmd0NfbeR
	v/FruGMn1s2owCXfqI/jm/7Gjz8z4+ggpEiAOoAkcIPaCNoA/KgtFHZ2bSn2PfxWHWmFXaOLfIX
	GSf1eAunAAEX3v1ZNsDeSStghhfT2VkDJbzVzmbYbu3k8hAGh3d8pjrCna0fOD3RZvOz2utcETp
	ZbovlKPZb004cdXCdRDoJB16sgBcxTRQVL1xZMDgUg7EbIDpOqUq1tKu+5+g55Mld2tV1hFwhuw
	FXkaDI1fxxWB0e/8rxSAMR02VVzIkkewYKkCdEaQDxCCT3B53CUcuIVnBGGR4hX0Fo6Oev9qkE9
	9WWjfW9Eyxbfio8A/4ShBb3+Hkwhm8dr1RPQ0FkAak/E7f4peC/CS0O65Yj4IydBZlJLRxeVhJo
	lCzwlavOrMPho/2DRCt8BSpBC2+9HwlWciTt7mToHE3+5Ato
X-Received: by 2002:a05:600c:3f06:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-4a18e4a3bfbmr34261435e9.8.1791546508147;
        Fri, 09 Oct 2026 04:48:28 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm77399465e9.6.2026.10.09.04.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 04:48:27 -0700 (PDT)
Message-ID: <803bf4ba-78d8-4896-affc-7d4df5c9d50b@gmail.com>
Date: Fri, 9 Oct 2026 12:48:25 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/cmd_net: prevent infinite retry loop on
 unextractable timestamp skb
To: Bui Viet Dung <dungvn2345@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: Willem de Bruijn <willemb@google.com>, lollipopkit <a@lolli.tech>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20b406ac-94ec-4b0f-a307-08082092ae08@gmail.com>
 <6ac7afc4.cf15ae49.1a8a2a.2a55@mx.google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <6ac7afc4.cf15ae49.1a8a2a.2a55@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 15:59, Bui Viet Dung wrote:
> On Thu, Oct 8, 2026 at 3:43 PM Pavel Begunkov <asml.silence@gmail.com> wrote:
>> Sounds fine since there are only timestamp skbs in this list, do
>> you have a test case?
> 
> Hi Pavel,
> 
> Thanks for the review.
> 
> The issue was spotted during code inspection of the error handling path
> in io_uring_cmd_timestamp(): specifically when skb_get_tx_timestamp() returns
> a negative error (e.g. -ENOENT due to missing PHC bindings with
> SOF_TIMESTAMPING_BIND_PHC or unavailable timestamp data). Since the
> multishot apoll remains armed on EPOLLERR and the unhandled skb is spliced
> back onto the head of sk_error_queue, it immediately re-triggers the command
> in a tight busy-loop.

Thanks, I can take a look tomorrow.

> Below is a standalone test program demonstrating the TX_TIMESTAMP command
> setup and execution with CQE32:
...> If desired, I can format this into a test case for liburing under
> test/timestamp.c.

That's always appreciated!

-- 
Pavel Begunkov

