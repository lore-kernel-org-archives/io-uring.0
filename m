Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A973E46D554
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 20:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096305; cv=none; b=Es9UTTrYEcWjolfXrVFSjxg9NlJCI9/OcmFzxHBvsfNjR10R829LqjqhYg9KMHZTMO6W3mf+VgFCRSroU5POqfp8mYYZkMg2MyGltURTdJxc6fk8R9M2igtY4mMu+AqrUoLJTlC8YWgZCjY+Ge2D6pNYkBnTdyk7JXPvz1l88y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096305; c=relaxed/simple;
	bh=qY6dVe7EZDBW01ez4gRTa3wVcl1U/MctK4jvg8AzgQU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aPDNKjuL5Ef9r3bog50OS9kFeo0XqVcrnZg3mhn2N+MyJRW0CbIM6qCwaRiN2F0C6jwYxpRGukOwq7D7gq7+yrNGbWUIsUhTwP5gIrfbkxIHwp9tAbqdwfBmmJMwuDiKvhgKB5LT6XA/aaw3Wr786rcp9qxA2F3LDnbtArLIx8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=mRaStVKK; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="mRaStVKK"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e915887d9dso23104625ad.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 13:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792096304; x=1792701104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5clQpnN4nAGc39KpzbJYzajR/ETjOEzamoYot6587g=;
        b=mRaStVKKsJub52+NORHaSBei1XR1PwYzssYKcx2J5DTUmFXTLvgAYAyXIRDmXYB3a9
         WgeammlqL7AoboZJvJqVjUJOtpr2PuPHFEkGXOrvFI38B/lPl/FriZUoyHZhL2bqE6H8
         Q+IPTkepC5B/GZoeBf6AodnbP2VB8dVD7O9Q/T7cIvYwP7FTFBocd/pAO5PSDxNL8D4y
         fcdt9/WYEaG8sFCcdVWDpsX6z1bYbhBCBomAgVKlbh0OHjjOKPosQ/mpf/Vofamy57ed
         g7K/2AQeC24QwbG5NI71htn6Ek6M3nmOTzhx0P07ES4/6Z9VuFJ5o6jMYKorD+S+DaQM
         8L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096304; x=1792701104;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5clQpnN4nAGc39KpzbJYzajR/ETjOEzamoYot6587g=;
        b=ufxnx2jJfFOrGMaIyK2BoLy47IMJSAXS4GSxdUCVZtzMqFRNF3GIV6nqtcI3c46qtT
         LQCZW8PcxGAaU2MkBobQ/G8UQe4H2jWXzJ88OdaMd74RcPr5uJZTiHgpmMWPtgUd2Cm1
         MVibu6b5IMB89XGypfxCin7Zjtk3YHgzIzYLaAXvSAFFAfupOmGtO5QFhUAzOB0hRarE
         Z1cfwidS6xx1TgOURTeBZNkxQa7zN/ICzgr4y2Q9/es36BYDELY2m3r2i+n3DI3FNL8i
         8SaFtt/1aO4lqI1RndLFDLoKwwRWv6u4zwDqrRQJ+9Y7j95RpivYOND03nZl7QbfRcMB
         lMXw==
X-Gm-Message-State: AFq9FYJAF1mvPhoZ4sMrS22u74lT2a6GCk1wmWFG42vZS7co7GsjSPCs
	lzXCT/AnwX55fF/2yWR1amZ30yFV+Lr2oX8UQzdRNrdFxRAvfVnOTn6OX8s2Q+LLsnJvbotvIwT
	lPsjm7eo=
X-Gm-Gg: AYBFou3H48yZGMHhVbXSaIjyRl8NjnNEBZ8GnMRpcLCjFC/QNrYnoU5YjdZPK7KKLaV
	dDvSWjEoDtP3ND37VnSACVKLS9+nFsbViJ0HI2z/LSq/oCottxeQ/q4Q1WlVkoYXnpA0Szky1HA
	8QzeEpZ1QpKBznzj/weZ4n4N35qoP2pg0GG5l8OTa1RZiM4t+YDS7nKqZOi3kprkeLTATLDvVun
	Ti7ZE/BKjJajqiQeK9+dWubsJWVwPc3SUbNuWFnL1PTAruVYgv45i+dM1AXf+ILPJ/FIkkPmj/Y
	HhcQOLt59nwOfSd+lrLKXmAGjHQGJaWtmLSGqIu5EQfOqwXrjhUSwrWhep9jaknZra2MSlAPXJW
	jLrH8KhGyvIdkrmC7pI5CjGo19YZySciMju9/kVi4o6Pr+j+3iQq2CNR7MLTJUaZnKGn4rOWSfE
	ijJZM8T/5HIiJL0wpj1xClw7cuwVuLJShNtZgfpkmUProD405DHOCzp0TEGirZM54/boVlk7mk/
	GChREh2hEKMnVpKmWFkPbEW75YzzBUiar0YsfF2lIrs2hNA9YDbU/NeiQ==
X-Received: by 2002:a17:902:ebcd:b0:2e2:c773:a37 with SMTP id d9443c01a7336-2e842ab68c7mr172699395ad.16.1792096303967;
        Thu, 15 Oct 2026 13:31:43 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d98d9sm1060325ad.2.2026.10.15.13.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:31:42 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Juanlu Herrero <juanlu@fastmail.com>
Cc: stable@vger.kernel.org, Anand Natarajan <anand@meta.com>
In-Reply-To: <20261013-pu-cmpxchg-v1-1-4ddc10fd8a03@fastmail.com>
References: <20261013-pu-cmpxchg-v1-1-4ddc10fd8a03@fastmail.com>
Subject: Re: [PATCH] io_uring/poll: avoid retry wakeup loss when dropping
 ownership
Message-Id: <179209630000.1859568.9804647387852543567.b4-ty@b4>
Date: Thu, 15 Oct 2026 14:31:40 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 13 Oct 2026 15:37:20 -0700, Juanlu Herrero wrote:
> If a wakeup sets IO_POLL_RETRY_FLAG between the owning task consuming
> the existing instance of IO_POLL_RETRY_FLAG and the loop check
> of io_poll_check_events(), then we stall on processing the request
> until an unrelated wakeup comes along.
> 
> Using atomic_cmpxchg instead of atomic_sub_return to guarantee both the
> count v and poll_refs are 0 and no wake-ups are missed.
> 
> [...]

Applied, thanks!

[1/1] io_uring/poll: avoid retry wakeup loss when dropping ownership
      commit: 937d38dcacd675dc0572d6c9b6743960df3128ed

Best regards,
-- 
Jens Axboe



