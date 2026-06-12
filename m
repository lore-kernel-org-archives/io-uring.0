Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45E02D6E66
	for <io-uring@vger.kernel.org>; Fri, 12 Jun 2026 02:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781231016; cv=none; b=RFrCPBxuaAOtF+tJ0HJ4Y7ghZHWUzKtYw4tgwQ65WSVefl4/4PWwEHtSi8zu2HLoWg7/DIv9jkEXzsP434n+pHAc6ZPOnw0COM9aabYVR/EMAtDRYv59lXqm79bezewuX+P+0hG/hGrAw1IwLHUmpsyvkZVoX3/cW7vvse3keeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781231016; c=relaxed/simple;
	bh=1MsqXddT4T/bDQPvlQEaUH5cXI6SOKf3ZfNbx8kSyAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UfoKRAVBl4oBsrIfdTciHdVk8aAHE8wt+Uwen5DJQX5G9MDmG4OBL6zWdTvpGNbywSFiOzNk5L7U85CRLj63j2PLoopFhxdBra7tLXScIahR3sse7KpQXkSZ2kwmpKGqt17Efg8Z8LBd8DEEIJjSvTKVF35rlrvn3pIvykNhPGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=h9nGLD/p; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="h9nGLD/p"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-486560db81cso530800b6e.0
        for <io-uring@vger.kernel.org>; Thu, 11 Jun 2026 19:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1781231013; x=1781835813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RPDXcs2XCRoSRs6vYJdUbWGgbl+4bqE7yhXbLtBVKuo=;
        b=h9nGLD/pthj/PAqgbMF7ztQBbF+qbuu7iVIEM+HspkMwnndtyPwdso9oqx9z3e9l88
         F1MeZiYBngymZANhDQVrE32jQR4dBWOi8mms8kJKJlTST0yPOUhI5yNMoFgXZXsVDaon
         PyKDt+4jh2m4AL1orfCAg80+ijopkrtfvabQs/IV5ifZpnr7xiZAv0L2n0IzEafbrIHJ
         5JkvbOjDNXXzCJnfA1JyTG/ZzmMtSMGyovkKTWO2h5PJU0x+skRkTD59eKA0SUx8ehTw
         e8wJ7ELYaL1RWbhYk3YJCF+QL5lNmUstWL8crXvoGNXt/FjguyEQu305rvudh5uBdd5R
         EKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781231013; x=1781835813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPDXcs2XCRoSRs6vYJdUbWGgbl+4bqE7yhXbLtBVKuo=;
        b=qffD9xxhxxyC1aIE2baqhIlfF01jIRbAui73x6ZUhv+sAJAWCacW/gDlMiPo3710fa
         m4NPWs7t//Q4n04A2Ne/eGIEwidvaYvP6/4GHMPWE6W/hoXynwuNx9sqYFKXfHd8MYHv
         t3shsoQwoSgBv29+Uvz4kBGRSn0PEX+2GkfjdlDPnEwbdodQENxSQBac3/5h+7sBzn78
         +joYEUGWOIEwqy1KT9TKz3ESVpdolb/vzhMwYm4Lo8h2rofvOy/4yuf4u38T449b+sNi
         mbBxngL9FICJ21RWWO9iWv+nLykwcGQHSM3nMfHQ7OrfC8sC569GvdFlrLSwakHehfLX
         Mknw==
X-Gm-Message-State: AOJu0YwiHybwalv9leGYBQr7btslO0GelF0ZAeDIJneVPV7DTjZ8S/2W
	BAPzZ4zWzCMfsKKpgao+bnKxxsk+7JlhB4ZC9a7Hbq8WbEbqJTrml/zo6+T8nfhAG2Y=
X-Gm-Gg: Acq92OEV4tRw/TgsKCPVB9ptVxhC9orH4sPd++W3m4sy4H1gHtn0vgkxYMEk6prYubN
	6uLnmxu1MTn7XIESa96MrOjvqguof4H9AvCXeecENMVqGS9JTMamURxfeDAGp9cAGJ26kfmDTiy
	FEvxLejJyroh1bCTGfQJf1gDVoIEwyOB2XjxbDJ2F3aMmlTKXVLIHzsi7qrMCHc7ldIDQCtR2XL
	ghYOOS3dLeBQv2FHf36VIKLBSx60UePVspp0WtF7ROj1P6D4pb2Xp8fW0HmauPDPkrgjAfkSLK/
	I7JJjzPasa5flqM0nH4LFJF9n5XhLdZXpAyu7/mJcNqUooY42kxcMXZZ7Iq4QgG/xLmi6ej/hcu
	aEkJN/J3IHl1LzTo+Y1CN5/ZhqLk1WcYEmGBDYHabMKDHmzAaFztbh/M9qWATwjMT4w68cpTkQK
	5krHqiu0zpLZ2+ALefRwoPt2K+KXdGbnlanIRLxXS3gKbtZu6dax+ZBPP4wb2yuYA8ptYKMUPwu
	VLilnT9Bw==
X-Received: by 2002:a05:6808:1813:b0:485:42f0:7eb9 with SMTP id 5614622812f47-4872f314ba6mr773765b6e.5.1781231013596;
        Thu, 11 Jun 2026 19:23:33 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48731555591sm239577b6e.10.2026.06.11.19.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 19:23:32 -0700 (PDT)
Message-ID: <4be7a6db-44bc-4125-867e-9d22c2809f1c@kernel.dk>
Date: Thu, 11 Jun 2026 20:23:31 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] io_uring: switch local task_work to a mpscq
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, dvyukov@google.com
References: <20260611160553.1486640-1-axboe@kernel.dk>
 <20260611160553.1486640-3-axboe@kernel.dk>
 <CADUfDZrzwvY6UpBBhLj1JynuNf5bo140+LbMYDOvU13=od+nkQ@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CADUfDZrzwvY6UpBBhLj1JynuNf5bo140+LbMYDOvU13=od+nkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/26 7:14 PM, Caleb Sander Mateos wrote:
> This is great stuff! I had also observed these hotspots on a ublk
> workload. Since incoming ublk requests post task work to the ublk
> server's io_urings and completed ublk requests post task work to the
> client's io_urings, there is significant cross-CPU contention on the
> task work queues.

Glad you like it! Once I post v2 tomorrow, perhaps you can try and run
some tests with and without and see how it does for you?

>> @@ -185,55 +183,47 @@ void io_req_local_work_add(struct io_kiocb *req, unsigned flags)
>>
>>         guard(rcu)();
> 
> Is the RCU guard still required now that a work list element can't be
> accessed after the consumer has popped it?

It's actually not. Might need the :

	if (prev == &ctx->work_list.stub) {
		io_ctx_mark_taskrun(ctx);

parts to just grab it in there, as lower down we'd still need it. But
the task_work part itself should not. I'll make that change.

Thanks for the reviews!

-- 
Jens Axboe
