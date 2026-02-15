Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E368309DCC
	for <io-uring@vger.kernel.org>; Sun, 15 Feb 2026 22:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771193613; cv=none; b=bAjVqHxyhnOX50WnuA4HeAriSbBEcJ5FsGU8kY4bQ4kupGW0ARZVymelU+8UtvCxRfjigT5l4Axfzq4G+pEoGn5DGZlqySYmSyA7uzBD8wKSmjImUIPNi+QeJkzdbR3OZ53QOggkmQYEJ05xM+3XD28hsV9hF4w7bfWgqSGAKi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771193613; c=relaxed/simple;
	bh=ZM2sgqWVYHUBIk8TfuUwBYR/LweHt/YEHrhI/LkCasE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SY5B2J2QNyEXwyzGXpksl1wg5oI+ZW+gTCPK0ISh0FNDNmKYggkcyPGO/of1kNEU/kOeqcdc1eP+tl0Up5+k5ca0hX8bkMPhR+xtziW2h6QrG9O1Syv/sUOxorT215yQgIeWcrQPAbcRW9iHC1Me2INA3rZH2JPjH2ZYZdR5JAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=MwkuDUIa; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="MwkuDUIa"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-45f171cb842so1443482b6e.1
        for <io-uring@vger.kernel.org>; Sun, 15 Feb 2026 14:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1771193611; x=1771798411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9BxlM9a0/95mC3yI7ZpKg4pISO7R5xtlXsaO0Q1tkw=;
        b=MwkuDUIaS7ehy39KT3/11dAIhMLddfJkvTyUyb76uwSbiKi3hcDgW9ehIgg1OVEMe7
         jFBr2LjQrC09NEi4j+fyCzBJbQQb9o7vV5IDAk9V56fXhoHjzwDsso/1Du8VtFQJLAlk
         SjFEesiJyfQOrT9ui70D80Y4fCS7h4NKbCdA5va9nRQ6F0XAdeepGGciy1eWjBCPJv/A
         aI7SwGS99QEjMWS6YO4rhXhOQKxUIwy5/nD3IYaLXk+5uxAH1UG0xWr76OeXPIeKDmB/
         ufrWPUGzikGo3C0YzBjrmRq0l8P8KXOaHHz20ak3xzNXwctgjC8rcZ/UGB4QSigX6Rn+
         do7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771193611; x=1771798411;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K9BxlM9a0/95mC3yI7ZpKg4pISO7R5xtlXsaO0Q1tkw=;
        b=X6Q2nQ7vBWHy/te2pRKcCKi1/0+gKYFU7F2BYrP/Q4wshepyA/FG634jBw0Q/TKzpx
         dhgiI9TZpH1KFUlJ5nKg0YzdKvI4UTYOasiZbhRt1Jks2wNzmQ5Pq1P3mY7IRjxT3+LJ
         Cf9n3eVu8jfuJxgsQwKZrX5RgXhRaBRrQJihLr3XJzagfv5C1hQ7mRQpcrFcQKWre0QG
         jTe0e0Ul4kCmNPzMS7SQMLK3GV2e6oLhGew2w6iYn8jVFZDzsO/irrzVXAK+uk7Z6CzS
         059aVTmFVF+p59LJ64bDvvJ9rKPZ+NkQw7WGDJckSbFZX5T/ajGax1D1JmbwCfwzKgwm
         5D/A==
X-Gm-Message-State: AOJu0YwpRydnn3XbJtAaEhY4Y08YB2eCiiyoMSE1MgaKASeaH1cf+bBT
	R0bIxTOEC0uJGBJq/VvSYhKnTVmnlq0/dl4yXaLGwo3z/cUqJC+DrOlvztlWq7bQ1d4=
X-Gm-Gg: AZuq6aLeCgKxBeahJtGrslecNtEzD4zffvWiZR+F18ire5VWelEvuUGbel6uaYOQXBQ
	XloTHW7dmS69iH5nC8vFm0sqrxMtgH6bRWkaCwkdDJ+4mVG9s81jfz9lPidUP2jqYakmI6Ypz4c
	cF97Jg1Ogv3pvXpZ3lKNR3+7ykKsxy/FG6ve7Ja3DCDEdXTleMIxW2Khq1KzOgxG/l+S48LXbMi
	zK5CH28rQ5yL2yRGYwZqdCtyGwPdTaWWyzCgAzKoDeXm/T2hmbA6QpSKGQAHoJYERbz4Vmhk0P2
	RIA9imHTPohbiQ23A24wOFsi9WMxtHT5sHva+nDX3iLJN9k3F0ml2Z0mJJZ30TePZgL7eOXGO8r
	9iv2xL+Qy0iSD3cK98WPaHhuMGYF+nvtP1AY/DNJBVyuCQbnnuL/LJQSbu6SoJ699aBfU1pv7Dx
	ucQatUZlM7Yy3byu3kOBABM6DkvFNYF2Ccp5MyzscMVHJHDzkE02Iylf+cZ1I0H/D93ZV3ssC1w
	4THar+IrsEYaDw=
X-Received: by 2002:a05:6808:19a6:b0:45c:7885:d560 with SMTP id 5614622812f47-463b05ea68bmr4043286b6e.16.1771193611133;
        Sun, 15 Feb 2026 14:13:31 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaf178c1fsm13191922fac.17.2026.02.15.14.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 14:13:30 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <2c2341d55728a89c0dd99e296f57c55ae8e683b7.1771191481.git.asml.silence@gmail.com>
References: <2c2341d55728a89c0dd99e296f57c55ae8e683b7.1771191481.git.asml.silence@gmail.com>
Subject: Re: [PATCH 1/1] io_uring/query: add query.h copyright notice
Message-Id: <177119361011.79392.9077316326382054274.b4-ty@kernel.dk>
Date: Sun, 15 Feb 2026 15:13:30 -0700
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 15 Feb 2026 21:38:09 +0000, Pavel Begunkov wrote:
> Add a copyright notice to io_uring's query uapi header.
> 
> 

Applied, thanks!

[1/1] io_uring/query: add query.h copyright notice
      commit: 6b34f8edf8b807b7f87901623aa52dfa1b29ef93

Best regards,
-- 
Jens Axboe



