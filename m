Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1B23E92A6
	for <io-uring@vger.kernel.org>; Wed, 25 Mar 2026 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450622; cv=none; b=pnzBcR/r8yljo0W5nZjZqP21hhFGOt0myF06/kiub7VfYbLNSGNF1KLTzyGwzRMsxBqTkaK8XeNqsFmPm7fC7fUaOLbZ8Wsdc0Z7eQMtKSX5vME0X4QtSisY0vK7EViUL3VhT1n8sv/UKcpqtVl2GEkypgFWbek532Sw2jBqN1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450622; c=relaxed/simple;
	bh=3OJ9EtWRrmMbHDYyxQiOhbbpzpQ4GwC6JJcBF3X7amo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MdFiO2/0+I9SgwastyrGr3jh5+oYt2//uPuWiGaol6PyfrFfwrNFJNmLlxR5XQpc1QkeNK3eM6uH4TTbwL8CPh215XIqFjHX+58gGQxtnSc0lmgpE6vj8SXnS2c4aA/wYcSc6fWxef5QInohFsgRDRvStW+q1Sn4x4KAZRkTnZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=N6xZaMOF; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="N6xZaMOF"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d751ef36ccso2708466a34.0
        for <io-uring@vger.kernel.org>; Wed, 25 Mar 2026 07:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1774450618; x=1775055418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFEAl7lKvbgn7T/UNEV0n6qSBcnT4WDqDfQQFILefNU=;
        b=N6xZaMOFFxigylwopc98isWD0Ingo8e2941v5Fj/ivK0fyk6ZQyK83C1m0okC4jhr0
         bFLCx7FOtvsnXZHJnweZiBK1PNCZ260eoUgrw8znYWkrNji03RvBV69fJJeltPhXWt2H
         2UxMaWhubLwbF1Q9BqDSZ0RVYEWWorXjLpUPUxssNnqkdqGtC6lvhIRO/VNyHrBlsAc8
         k75gWtZMqimWQAAMZE+sdi0SBbiEqQF+JDJIJIhqVaC7qyJYeg5wJdzAr2kUmgUTsw1I
         sfVmnvASbt7ExSoDYvkJ15A1uDWmL86pTV0fPkHrMYzAr/YBarRkaxT8yJDzEMmRCwAL
         VULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774450618; x=1775055418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFEAl7lKvbgn7T/UNEV0n6qSBcnT4WDqDfQQFILefNU=;
        b=jF9o0D6LxSPRP5MYKz3T8Tql/HgX0oe8pK2nvQUc0yWpG0AJ8JovGTtLK0CmlqjRsX
         V4jXrl9a2hO9iIBb7tsP/j/fLve9od9uRskHVlG3jWfk20A7qlYi/Ji/0LJUbGWP2V9p
         dyTTFYJ+nbXK9zjnz1OVzO3/ae7tkrnu7FyYTfCUJhSGtpHsuRwMq60SH9ic6G3veB/u
         tummViPxCRrHrkDeQOJQ4VjM8rAWHrqz3ncGYqVQW9ZW0KlKIMIEizZ5QOBN0jYixvTC
         larouNappPklxY2/uPjE3KYaCbyaK8XECbewfB8aQDE1yAw9GP4NTJ1rE8vC+Rz4Ph7S
         Abvw==
X-Forwarded-Encrypted: i=1; AJvYcCVK5/14KTc9qCbzqi3/eZf/8OGNDTiji+tRwGUtjN0VMVe3hQO4OyRjzf9UGN3moA3bK6bFofrPwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTQFh/V1ppjwKjxalxmKYuLMy2uXpLpFW2G7QtPp3gz6VyQvLf
	3LXQvpAHD+XC8gO0PdVs/Vy0F+M6NFe8RQVGnS+lg0o7wjXhEUrwQTs74PjiHmnSikvdwVh9LP9
	8m1aKf9s=
X-Gm-Gg: ATEYQzwbLA7PLRc+2AMnB4ZPdWDhsJ4XwuFNFguNclpoA7QInfhjnaR1kVhI31a7iyW
	nE3CJxCYj8TIQS8rbYI7b/uHt+gAR8aK6frQF3KXvYhIN78pGeVF3AkcQqhA9z27v9Q/bzisQ5r
	xxZ7gCHZZeUfSvxgUgnyxf8K+xLbUvohWzJ0KnSNCsvF7Y3wmUb7SPAeGN3qR1n616aoPHZ1A+I
	4kzIv6eF4yg6GF/SrpGeD4uLL2/oa22ryz/wDq10lCSp5LKwhGn8vKLMwfzJKJXt6kKjfXWxFxK
	GOBQJLIeieE2H1bM+YCdEaNJdF5iJ7L65PMErnaZrm1d7NoXSLfzwc3YLNERu9N7em09QDbWe8W
	l3ZpRBElSwXPaGVpHiKWuYva4UyUrctvZpyf9oQ/5UCh6YB9k6DJ6B01FE1T6Vk6EfAYNwEMfIX
	K+z4WqQ8Y81KTvAfSDAhN4uvKThBINSmKklTrsgM1TR34kidfIPIpNqpmQJiUcP6/v7VirOX8YV
	7PPxGAbGnq2Y6IMta4i
X-Received: by 2002:a05:6820:80c1:b0:67b:ba75:3eaa with SMTP id 006d021491bc7-67dff39eeadmr2150629eaf.11.1774450617674;
        Wed, 25 Mar 2026 07:56:57 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e0a9095c9sm115184eaf.0.2026.03.25.07.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:56:57 -0700 (PDT)
Message-ID: <78925323-89b4-4def-aa5a-6138b4aa5d1c@kernel.dk>
Date: Wed, 25 Mar 2026 08:56:56 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] io_uring/rsrc: add
 io_uring_registered_mem_region_get()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: csander@purestorage.com, asml.silence@gmail.com, io-uring@vger.kernel.org
References: <20260324221426.3436334-1-joannelkoong@gmail.com>
 <20260324221426.3436334-6-joannelkoong@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260324221426.3436334-6-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/24/26 4:14 PM, Joanne Koong wrote:
> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
> index cf5638406a0c..c706324fd66d 100644
> --- a/io_uring/rsrc.c
> +++ b/io_uring/rsrc.c
> @@ -1182,6 +1182,24 @@ int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
>  	return io_import_fixed(ddir, iter, node->buf, buf_addr, len);
>  }
>  
> +void *io_uring_registered_mem_region_get(struct io_uring_cmd *cmd,
> +					 unsigned *nr_pages,
> +					 unsigned issue_flags)
> +{
> +	struct io_ring_ctx *ctx = cmd_to_io_kiocb(cmd)->ctx;
> +	void *ptr;
> +
> +	io_ring_submit_lock(ctx, issue_flags);
> +
> +	ptr = ctx->param_region.ptr;
> +	*nr_pages = ctx->param_region.nr_pages;
> +
> +	io_ring_submit_unlock(ctx, issue_flags);
> +
> +	return ptr;
> +}
> +EXPORT_SYMBOL_GPL(io_uring_registered_mem_region_get);

This looks suspicious, but I actually think it looks suspicious because
you add the submit locking around it. For patterns like that, it makes
the brain go "hmm, what protects this from going invalid the instant
io_ring_submit_unlock() is called??". But this should be stable for the
duration of the ring, hence the locking should not be needed at all?

I'd probably also prefer wrapping this in some kind of return struct, so
that you just return that rather than having one part returned directly
and one stuffed in a pointer to an unsigned for number of pages.

-- 
Jens Axboe
