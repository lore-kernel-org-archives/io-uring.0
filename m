Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6DB3CE4B1
	for <io-uring@vger.kernel.org>; Wed,  7 Oct 2026 21:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791409147; cv=none; b=gLLbFM3kXtLcQGQ//irCCkJRTcZxGCgsQRU74rcppenTk0gn4/tGKg8G4pX2ieTc3TMH6DTO1zI8x4fnNd2Y9WVDX+s64mobdqaw0B5UtEcOIs32fj8bdZZr+EbSVwpBX17JRMC0O+P4+Z6Q2lTUNc/C2QQ9jKIe9g0ONc+Rz9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791409147; c=relaxed/simple;
	bh=m75zAdiB+DiHeBhIT7/NDF0jrhd2N/8nNDu8zkrCLME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=redHSjnhDy/OgHKXQpKO6arnvpq+liOBNdrQHX0VHxCzdoynuUbF2BC1FwWhZchS4qkoM7el+tayL7g6vuocoT+Qyrs0XB/yrvXhmgMX03wUf30QSWTE+yI2jNbdx3gnF8OVSMeXtBVgfNu92BrKcEj+EwlIdDc0cU1sncun+Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=NOcgeb3b; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="NOcgeb3b"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1419d3416ceso8574867c88.0
        for <io-uring@vger.kernel.org>; Wed, 07 Oct 2026 14:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791409145; x=1792013945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvelYgL0azW0r2hNjgSFdCNbSeLU7EMO+TGCTarLzMM=;
        b=NOcgeb3bfU48l4/7mJXAvBXyC8cMI9v7icpyjQTJLJ5u5LIIKBC6+4LlD5Ggs0PdDo
         X2ZdzW1el56QryWFyjESeOEaDHzQR5cCCOyc0WwMYon4Nfe+yUg5IRKpPAUbrp3YRG4P
         xV4TK5j2194MOhVdkgcbMkMjh2nBU8uX7Fv3DMZnYxPGpDHKPnk8lQmtXVSXkqa7NAAK
         VvCTz4wF4untE6TautycjMp1/+fJdaRH9vBZLIA6bFCN6nZlu3Y6zxLmgp/ZT26yzY4F
         y7XT4LlEfo0hhPfZdjN0gQShcq9GoGRjUlNINayfIzOPGQSoHdqzs4oGrDBJ/jPlu2Vq
         1Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791409145; x=1792013945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvelYgL0azW0r2hNjgSFdCNbSeLU7EMO+TGCTarLzMM=;
        b=lObRpO7aWQ7/FrDE6COniGBUBx1JLTALO6evc7vG7QZHTDqQbzlKgqalgnnp/4MJCe
         eT95VEv+nPmYBQL8s3F5SCsZg035ac1IXB2AU9Jdpd9Igljl8TDsf1TFdrOAVA9lNh9/
         MIEIFAaKMjFDrj81/w7oODxaHBWX2dMe3eFTB1h92EtXp40cqtI+bNwETgRHaYBe4jK4
         rC8WySTOpHnRoL6AOJVXdEJU8aR0gY+hWq3x5+tc7qU5Bj2hW+v2CObfbWYzd+8BSyRQ
         m8qyAU9TjjCIZJKi+UDHvLkM1NKF6AimW6V11SnUW0X4LsxmAYFjwXOwi5IF7was8oop
         c4MQ==
X-Gm-Message-State: AFuF++nj5ISC0AOlvj89zXPdpYaIja5EHMEEPzQrPowqRzm11whFAW2A
	lH9PNAJmBVaav0B0luhUGSfvMKLx7VSFa3hrhkEI3YtOK//j8hIqNSZa2tg7lxyCcuwzI+AaCA2
	p2Oah
X-Gm-Gg: AYBFou3dqv7nb6+tqPO0uWJ9hM/munxuN4rnFF2NGp6NZZdlooSoYTw1FGsPcMtLLTO
	sY7ax5Sd4Bsgr7QN6fqwuggkQ2EvHpbLZi6h9qvhluYiMhk+5f7MXhWM86ZuFamQhLOzk5TxXYC
	v/oJA7De7L5tPGa9ZqTe0x+xT6dBudarmfpa1Vs4c+McquzWQsw+rq3E125/+wmISN8+JjxzFN8
	IbSetePWEDeLlOlOIS01qaWKx0XDF7aqQt+u/wh2K1DY4NEjLb8wZsM0AYIAPbEChQ2/IC5lgZz
	7kRUZcZycnaHDCW+0BMHOFGVdTb9ShL9gClsLPxqWAO7fCFZDVxl2PrEhrkCoaxrBx5zHIICuNX
	VQYShunTtYhegn0eDYqpEjfv6Bx2ZsGgwxlMMPbqd/e6inZZs77B8B1c7fSKk3g9uPceRxaKn4G
	nGZwK50SBMdlMtKlt9jXpN7VG+E58wjoB5tSRXIBmzzgjuk/WSAPrRKESyQBY/BkXazihHQnDFO
	5jZLsoNwZEz8XMQlxqRTrzJqUtHXM1jEcNKIXnscvAsIMs45b6CRVw=
X-Received: by 2002:a05:7022:7f19:b0:164:3237:4485 with SMTP id a92af1059eb24-1643237485dmr1908167c88.0.1791409144994;
        Wed, 07 Oct 2026 14:39:04 -0700 (PDT)
Received: from xps16 ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1616602b33asm8788217c88.3.2026.10.07.14.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 14:39:04 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: dw@davidwei.uk,
	hengyul@cs.unc.edu
Subject: [PATCHSET 0/2] Fix memlock account for kernel backed memory
Date: Wed,  7 Oct 2026 15:38:55 -0600
Message-ID: <20261007213903.445430-1-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Traditionally, kernel allocated memory did not account against memlock
limits, but a change in 6.14 inadvertently broke that. Reinstate the old
behavior.

Split into 2 patches for ease of backporting, and based on this original
patch and report:

https://lore.kernel.org/io-uring/20261006125732.3425762-1-hengyul@cs.unc.edu/

-- 
Jens Axboe

