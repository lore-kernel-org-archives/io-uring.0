Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038401;
	b=suWiDtP/7CGwatlJKt+OpCHXpZUqaVXwiZK1hFVlmycra/FAzBxd36a+YDM7DiY9Qv7e
	 huyNAnZSbzc5q82gYmLuHtkHXkFRbKj12IQOK9VAsMOplkaAS3lHUJ5dNdn4Ry2y6Komo
	 vzEALXvPgveFmy9BcIk56AJ9xtjm8mHZ0yiD+1ZE4wX0dYmo0S/mWvseNCbMkWkIxY2zH
	 DnQwKSU1BuNqIF9aNg4AkILRTMuH02Njd7nVvzbL7UseUSEwo9/8mdmg3oA5Qay64j4dg
	 qfyFJuYx0r/l/uDQ4snv5UKhDZIgLm60j8N2Dpe1/DNrL8fOawfI85GbC+ek5J6vSjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=Bt1mstHe0aPPzMoWiifHLBxuP8BhF2Aylnt4ZIJAVNk=;
	b=KUHKy/b1j/3s6kBO72oBRK4Wd5SD/wHLSDfzzsTMhr8GkjM2RZjAn/HUPlUbXqCh14MS
	 Fso2ko73c1/+qPZ/LqnOJWUVqNuQZ5ZVyrWHm3r94zNAerfKE651AhRAy/DgKaUSz7o9C
	 fDwHfNZhzR3ZH8M6VRxG7xmHgAxJm5NPqNM623OBzJUWtg7Bt1uPjHuf4dgR7CkeTOTBa
	 aktNRF8oN5Dzy3H90ZQhWolzLSLGJGvlKPhrSfKB7/k95/ttzVaHUllmnCRx9MnTLmKLw
	 Fzu+JzewOdQCWbU9Nzv6FNoiQJ5hXCEo3VqifmODPWyrwkJ9FLq1aZKSaNFxa/sOgIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rRPxGZbP;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68238606A332
	for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 18:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68238606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rRPxGZbP
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so1105272c88.1
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793038399; x=1793643199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bt1mstHe0aPPzMoWiifHLBxuP8BhF2Aylnt4ZIJAVNk=;
        b=rRPxGZbPGVn2FJ12jwrjcJXx0sbEqgV8x16QjbOjNwGRGTovHCPRbTjS4AL/5uKZDZ
         7fM6HHndhX8cgK8TwhQj45CP5VrVAivXGbw2ImQ7hS0RCc/wtexajeL/aOyckxWOZsG/
         QJwDbNHIE1Vv30Rf4l13iGij6UjVI2WpLgSzhDsHDDYqHG+mwjs4UkYkumcEVfCKrWDQ
         2f4EpEfmP8X9t3otHw8S0Fh+D70U5rLmb2ob2K+2+sgfMCmuXsklt1KG7PBWQvO193Ze
         tTjs08cGFHn5atE+hrKqtIBuBBqO4ofGXBVARzveI42gu9P3xvS422gXs6dmHnpKzH1h
         aXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038399; x=1793643199;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bt1mstHe0aPPzMoWiifHLBxuP8BhF2Aylnt4ZIJAVNk=;
        b=et8ILzjGOGpXrFk5aah/OxlbsWf8wN031Gjz6aioGiyN0c1D0M3KAKbnLWcd+s67vg
         Wx3juZwv5BASlzkYAJGPdJOqRARhMAajF63FL2GYF0YwD4QWScUTKGvgcvKiQgW7W4dm
         RSclWQwSBEMfzHw7fWu3zqP0sLBtPNQhCe4JBvXj/Y8CD88nW6k0oiFq1Y9zkpvCZ89+
         ElisciG7oUOch4J64OW3pzdEzkYtMCvn4RxjpIj7L/X5YHUl5d9lwUfCmpKXf8eIJArJ
         SlBSFEx8e7RMtF7mpYE6MJ+ZnXKOQR0qXoRFTS1aZ12ovv+xUKzE+n6pkX7hcaG+La/Y
         OqrQ==
X-Gm-Message-State: AFq9FYJckFMyP+LwIPX5IwcPRKxCHBRqiX6DjQBrysPNFUKOkNgyDhEj
	0dYQlUHqZoEwN6bt/5320F5tGREkye1oHDo2PMqaOFc7N1cQzDVlj+mUI/arjPIEePhPQmCjv76
	dm4t9ex0=
X-Gm-Gg: AYBFou05F6I6jyoJ3yc4eC4SV+MRofP5g2WU/sIhzJ6Z71HTAcmZONBPyBQAYhE+NaX
	klIClSBlq1ieQ7n+XSunDeCXd4/+QAltmrp5V3mypyYVQ9DDb4LmP/T5llb4TCTuHDbz3V5chFn
	q7+LL7w2arpkoRmifFNvanhUu9/VT6T24a9o9l2HjL6hRiGzVxvgAxeHZbp/hdlU4nacmU7HdXO
	8ZArIkgopjLTC53T3AZlziPmS9sFQzJ/OvtTwTfXLxF2PZnWwAB6s5uibNHKLbI+t7pttX2T1vR
	pLdlIicKVjV1ID/NELHcQp5vuO6NmEojQiAXeUbRUNJHZSWR+M9166tGKpzpMc5NDhnTQxFpiNy
	4+g5F1kQ9ZLnCzOT60b45oSbn4XxjQ2pA9JxSoH9VHYIgRbrqbOTtHwZebMp2vuKHqLNe4HMmB/
	UA+nEC525S1Q6G3R2ucpaFdXbRE3x35hMZdwYwI1YS9GJZ8YeFGdT8PCJrbzMLj6oQTQTpPrWNh
	OO4/x4uVHShtGusmYarV0EDSuMHM/JUlwEMhbB848Xouaq1JmRevhfUJ6xkJWNGkx1Ieh9UaeeO
	8g83TVubZSNDW+d4NoZXbRrDiOiH6QGS0uGfNfw=
X-Received: by 2002:a05:7022:2227:b0:151:2068:e81f with SMTP id a92af1059eb24-19937022415mr16449905c88.27.1793038399454;
        Mon, 26 Oct 2026 11:13:19 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm23576455c88.8.2026.10.26.11.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:13:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@meta.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023144953.3584118-1-cleger@meta.com>
References: <20261023144953.3584118-1-cleger@meta.com>
Subject: Re: [PATCH] io_uring/net: Remove useless min_not_zero() usage
Message-Id: <179303839876.792754.4345795661172032065.b4-ty@b4>
Date: Mon, 26 Oct 2026 12:13:18 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Fri, 23 Oct 2026 07:49:52 -0700, Clément Léger wrote:
> In the else arm, sel->val is necessarily 0 so the min_not_zero() actually
> always returns kmsg->msg.msg_inq. Remove the min_not_zero() usage and
> replace it with kmsg->msg.msg_inq.

Applied, thanks!

[1/1] io_uring/net: Remove useless min_not_zero() usage
      commit: 70884ea2d636611e547f3da85fbfb8aadfa2ab4d

Best regards,
-- 
Jens Axboe



